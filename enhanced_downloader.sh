#!/bin/bash

# Enhanced transcript downloader with episode metadata
# Downloads transcripts and adds episode titles, numbers, and timestamped topics

echo "Enhanced transcript downloader starting..."

# Create a temporary file for the RSS feed
rss_file=$(mktemp)
curl -s https://feeds.transistor.fm/tomorrow > "$rss_file"

echo "RSS feed downloaded. Processing episodes..."

# Extract transcript URLs and process each one
awk -F '"' '/transcription.txt/ {print $2}' "$rss_file" | while read url; do
    id=$(basename $(dirname "$url"))
    echo "Processing episode ID: $id"
    
    # Find the episode by searching backwards from the transcript URL
    # We need to get the episode data that appears BEFORE the transcript URLs
    # The transcript URLs are at the end of each <item>
    episode_section=$(grep -B 100 "$url" "$rss_file")
    
    # Extract title from the most recent <title> tag
    title=$(echo "$episode_section" | grep '<title>' | tail -1 | sed 's/.*<title>//; s/<\/title>.*//')
    
    # Extract episode number from the most recent <itunes:episode> tag
    episode_num=$(echo "$episode_section" | grep '<itunes:episode>' | tail -1 | sed 's/.*<itunes:episode>//; s/<\/itunes:episode>.*//')
    
    # Extract publish date from the most recent <pubDate> tag  
    pub_date=$(echo "$episode_section" | grep '<pubDate>' | tail -1 | sed 's/.*<pubDate>//; s/<\/pubDate>.*//')
    
    # Extract topics from the description CDATA
    # Get the description section and extract topics
    topics=$(echo "$episode_section" | grep -A 200 '<description>' | \
             sed -n '/Topics:<\/strong>/,/<\/ul>/p' | \
             grep -o '<li>([^)]*) - [^<]*</li>' | \
             sed 's/<li>(\([^)]*\)) - \([^<]*\)<\/li>/\1 - \2/')
    
    # Download the transcript
    echo "  Downloading transcript..."
    transcript_content=$(curl -s "$url")
    
    # Create enhanced filename
    if [[ -n "$episode_num" && -n "$title" ]]; then
        # Clean title for filename (remove special characters)
        clean_title=$(echo "$title" | sed 's/[^a-zA-Z0-9 ]//g' | sed 's/ /_/g' | cut -c1-50)
        filename="ep_${episode_num}_${clean_title}.txt"
    else
        filename="${id}.txt"
    fi
    
    # Create the enhanced transcript file
    cat > "$filename" << EOF
================================================================================
EPISODE INFORMATION
================================================================================
Episode ID: $id
Episode Number: ${episode_num:-"Not specified"}
Title: ${title:-"No title available"}
Published: ${pub_date:-"Unknown"}

================================================================================
TOPICS & TIMESTAMPS
================================================================================
EOF

    # Add formatted topics if available
    if [[ -n "$topics" ]]; then
        echo "$topics" | while IFS= read -r topic; do
            [[ -n "$topic" ]] && echo "  $topic"
        done >> "$filename"
    else
        echo "  No timestamped topics available" >> "$filename"
    fi
    
    cat >> "$filename" << EOF

================================================================================
TRANSCRIPT
================================================================================
$transcript_content
EOF
    
    echo "  Created: $filename"
    echo ""
done

# Clean up temporary file
rm "$rss_file"

echo "Enhanced transcript download complete!"
echo "Files created with episode titles, numbers, timestamps, and full transcripts."