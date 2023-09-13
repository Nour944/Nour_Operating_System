nano my script.sh
#!/ bin/bash
chmod +x my script.sh
bash my script.sh
bash −x my script.sh
wget https://github.com/footballcsv/belgium/archive/master.zip
unzip master.zip
python3 preprocess.py
python3 train.py
python3 evaluate.py