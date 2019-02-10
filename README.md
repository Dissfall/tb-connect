tb-connect
==========
tb-connect created to simplify connection webhooks trom service [TextBack](https://textback.ru/)

![alt text](https://github.com/Dissfall/tb-connect/raw/release-1.0/screenshots/1.png)
![alt text](https://github.com/Dissfall/tb-connect/raw/release-1.0/screenshots/2.png)


Instalation
-----------

tb-connect not required instalation. You can start scipt in BASH-like envirnoment:
```shell
git clone https://github.com/Dissfall/tb-connect.git
cd ./tb-connect
chmod +x tb-connect.sh # optional
./tb-connect.sh
```
Also you can add it to the system PATH to run from anywhere. For example on linux:
```shell
sudo ln -s <patch to script> /usr/local/bin/tb-connect
```

How to use
-----------

After starting the application, you will see a pseudo-graphic interface. In the first window, you must enter the API-token and url to send webhook. In the second window, you must select the events to be sent using the arrows and the space. As a result of the program, you will see the process of the query and the result. If the result is successful, you must save it.

Contribute
----------

Ways to support project:
 * Write code and documentation ([GitHub pull requests](https://www.thinkful.com/learn/github-pull-request-tutorial/#Time-to-Submit-Your-First-PR))
 * If you have issues add it to [Issue Tracker](https://github.com/Dissfall/tb-connect/issues) ([How to write usefull issues](https://upthemes.com/blog/2014/02/writing-useful-github-issues/))

 License
 -------

 The project is licensed under the _Apache 2.0_ license.
