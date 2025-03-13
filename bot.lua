name: Run Lua Discord Bot

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  run-bot:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Log in to GitHub Container Registry
        run: echo "${{ secrets.GITHUB_TOKEN }}" | docker login ghcr.io -u ${{ github.actor }} --password-stdin

      - name: Build Docker image
        run: docker build -t lua-discord-bot .

      - name: Run Discord Bot
        run: docker run --env DISCORD_TOKEN=${{ secrets.DISCORD_TOKEN }} lua-discord-bot