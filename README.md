

------------------
 <pre>
 ╔╗ ╔═╗╔╦╗╔╦╗╔═╗╦═╗   ╦╔═╔═╗╔═╗   ╔═╗╔═╗╔╗╔╦╗╔═╗╦╔╗╔╔═╗╦═╗ 
 ╠╩╗║╣  ║  ║ ║╣ ╠╦╝───╠╩╗╠═╣╚═╗───║  ║ ║║║║║ ╠═╣║║║║║╣ ╠╦╝ 
 ╚═╝╚═╝ ╩  ╩ ╚═╝╩╚═   ╩ ╩╩ ╩╚═╝   ╚═╝╚═╝╝╚╝╩ ╩ ╩╩╝╚╝╚═╝╩╚═ 
</pre>
------------------

![](https://github.com/offgrid88/better-kas-container/actions/workflows/Build_on_ubuntu.yml/badge.svg?event=push)

better-kas-container is a Docker container script that provides a convenient environment for compiling Yocto images on any operating system. It is based on the crops/yocto:ubuntu-20.04-base image and offers several options to customize the build process. It has kas the Setup tool for bitbake based projects.

## Features:

- Interactive Shell:The -r option starts a shell inside the better-kas-container, providing you with an interactive environment to work with the Yocto build system. This feature allows you to execute custom commands, explore the build environment, and perform additional tasks as needed

- Seamless Permissions:The container has the same group ID (gid), user ID (uid), and username as the host, solving permission problems that may arise during the build process. This feature ensures that file ownership and access rights remain consistent between the host and the container, preventing permission-related issues.

- Smooth Workflow:The container mounts the home directory from the host, allowing for a seamless workflow as if you were not using a container. This feature ensures that your familiar file structure, configuration files, and environment settings are accessible within the container.

## Usage:

To use better-kas-container, follow the steps below:

### Step 1: Install Docker

Ensure that Docker is installed on your system. You can refer to the Docker documentation for installation instructions specific to your operating system.

### Step 2: clone this repos
```
git clone -b {branch} https://github.com/offgrid88/better-kas-container
```

```
cd better-kas-container
```

### Step 3: Run the better-kas-container Script

To run the script and start the better-kas-container, use the following command:
```
./bkc
```

Syntax: ./bkc [-r|b|h|v]
options:

r     Run the container

b     Build.

h     Print this Help.

v     Print kas version for this script.


## Examples:

Here are a few examples to help you understand how to use the script:

1. build the container
```
./bkc -b
```

2. Run the better-kas-container and start a shell:

```
./bkc -r
```
------------------

### TODO

- [ ] Add function to create specific user with right settings for only compilation purposes, for OSes with weird permessions settings

The better-kas-container script simplifies the process of compiling Yocto images by providing a Docker container with a pre-configured environment. By utilizing the available options, you can easily build and customize Yocto images to meet your specific requirements.

Contributions to better-kas-container are always welcome! Whether it's submitting fixes, reporting issues, or updating documentation, your efforts help improve the project.
------------------
