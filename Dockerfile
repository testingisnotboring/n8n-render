FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Expose the port n8n runs on
EXPOSE 5678

# Use the full path to n8n or use npm start
CMD ["npx", "n8n"]
