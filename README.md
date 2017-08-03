Tibco EMS Docker image
=========================================
These images allow running a Tibco EMS server in a docker container.

## Important note before starting ##
Due to licensing issues, we cannot include the needed Tibco EMS distribution here. You need to create a tarball of your EMS directory (Linux based) and add it to the root folder of the project, with the format ems-[version].tar.gz, eg.: ems-8.3.tar.gz. Make sure to include starting at folder **ems**. We also recommend including only the **bin** and **lib** folders for size reduction purposes. Sample structure for version 8.3:
```
ems
 | 8.3
    | bin
    | lib
```

You can decide which executables to leave, we choose to leave all.

## Usage ##
Clone the repo into your system:
```bash
git clone https://github.com/unravellingtechnologies/docker-tibco-ems.git
```

Add the tarball of the Tibco EMS version you want to run and build the image:

```bash
docker build -t <name of the target image and tag> .
```

And run the container, which will start a default server listening on port 7222:
```bash
docker run -p 7222:7222 <name of the target image and tag>
```
You can change the default configuration set in the _config_ folder. However, we suggest mounting a volume at the target folder /tibco/config:
```
docker run -p 7222:7222 -v /var/myconfig:/tibco/config <name of the target image and tag>
