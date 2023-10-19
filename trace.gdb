# Open the output file for writing
set logging file /tmp/thread_info.txt
set logging on

# Switch to each thread and print info
info threads
t a a bt 

# Close the output file
set logging off

