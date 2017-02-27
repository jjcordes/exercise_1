# exercise_1
W205

Some tips on running this code:

  (1) Set up and get EC2 instance running and with an EBS volume mounted as described in Labs 1 through 3.
  
  (2) Connect to the EC2 instance by using the "ssh -i ..." command from the folder with your .pem file.
  
  (3) Make sure hadoop and postgres are running ("/root/start-hadoop.sh" and "/data/start_postgres.sh")
  
  (4) log in as w205 user ("su - w205")
  
  (5) Grab these files (either scp them or clone the github acct - "git clone https://github.com/jjcordes/exercise_1.git") and put them in the /home/w205 directory
  
  (6) "bash /home/w205/load_data_lake.sh" to download the data and move it into the appropriate hadoop directory structure.
  
  (7) "hive -f /home/w205/hive_base_ddl.sql" to import the data into 5 tables (hospitals, effective_care, readmissions, measures, and survey_responses)
  
  (8) "hive -f /home/w205/transformations.sql" to create the working tables used to answer the questions.  For simplicity, I put all of the transformations into one file.
  
  (9) The remaining sql files can be run from the command line such as "hive -f /home/w205/best_hospitals.sql", however, I like the flexibility and interaction of the hive command line, so these instructions will assume that approach.
  
  (10) "hive"
  
  (11) "set hive.cli.print.header=true;" to return field names along with results for the following queries
  
  (10) copy/paste content of best_hospitals.sql to see the top 10 hospitals
  
  (11) best_states.sql for top 10 states
  
  (12) hospital_variability.sql for the procedures with the highest variability
  
  (13) hospitals_and_patients.sql contains several sql statements to find the various correlations.
  
  
 Other notes:
 
 I provided two ER diagrams.  The logical ER diagram shows the data relationships as I think they exist in the "real world".  In other words, this is how I thought
 about the data.  The second diagram shows the data relationships between the new tables constructed by the transformations.sql code to simplify the task of
 answering the specific questions in Exercise 1.  I called it the "physical" ER diagram because it represents the tables actually used in answering the questions.
 
 Each txt file contains the results of the queries and an explanation for how they answer the questions.
 
 Enjoy!
 
 (making a small change so I can create a new branch)
