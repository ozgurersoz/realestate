# Project Setup Guide

This guide explains how to set up and run the project on your local machine.

## Requirements

Before starting, make sure you have the following tools installed on your system:

- Tuist (a tool for generating Xcode projects)

## Setup

1. Install Tuist by running the following command in your terminal:

```
curl -Ls https://install.tuist.io | bash
```

2. Run `tuist fetch` command to download all the necessary dependencies used in the project.

3. Once the dependencies are downloaded, run `tuist generate` command to generate the Xcode project files.

## Running the project

After generating the Xcode project, navigate to the project directory in your terminal and open the `.xcworkspace` file. You can then run the project on a simulator or a physical device.
