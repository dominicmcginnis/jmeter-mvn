jmeter-mvn
==========

This repo contains a setup for running jmeter from mvn using the chronos plugin.

The basic (essentials) are all in the pom.xml file.  

To run, just add your tests into the "src/test/release" folder and run: 
mvn chronos:jmeter jmeter

