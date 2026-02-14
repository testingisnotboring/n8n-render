FROM n8nio/n8n:latest

# Set working directory
WORKDIR /data

# Expose the port
EXPOSE 5678

# Start n8n using the full npm command
CMD ["npm", "start"]
