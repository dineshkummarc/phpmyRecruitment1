
CREATE TABLE IF NOT EXISTS user_account (
              id INT(11) NOT NULL AUTO_INCREMENT,
			  e_hash VARCHAR(255) NOT NULL,
              user_type VARCHAR(10) NOT NULL,
			  email VARCHAR(255) NOT NULL,
			  password VARCHAR(100) NOT NULL,
			  is_active ENUM('N','Y') NOT NULL DEFAULT 'N',
			  contact_number VARCHAR(12) NOT NULL,
			  email_notification_active ENUM('N','Y') NOT NULL DEFAULT 'Y',
			  user_image VARCHAR(255) NULL,
			  avatartemp VARCHAR(255) NULL,
			  registration_date DATETIME NOT NULL,
			  last_login_date DATETIME NOT NULL,
			  ip VARCHAR(255) NOT NULL,
			  activated ENUM('0','1') NOT NULL DEFAULT '0',
			  last_notes_check DATETIME NOT NULL,
              PRIMARY KEY (id),
			  UNIQUE KEY email (e_hash,id)
             )
			 

CREATE TABLE IF NOT EXISTS seeker_profile (
              user_account_id INT(11) NOT NULL,
			  e_hash VARCHAR(255) NOT NULL,
			  firstname VARCHAR(50) NOT NULL,
			  lastname VARCHAR(50) NOT NULL,
			  date_of_birth DATE NOT NULL,
			  gender VARCHAR(6) NOT NULL,
			  seeker_bio TEXT NOT NULL,
			  cv VARCHAR(255) NULL,
			  profile_strength INT(11) NOT NULL,
			  last_job_apply_date DATETIME NULL,
			  last_check_bookmarks DATETIME NOT NULL,
			  last_checks_jobs DATETIME NOT NULL,
              PRIMARY KEY (user_account_id),
			  UNIQUE KEY user_account_id (user_account_id,e_hash)
             )
			 
CREATE TABLE IF NOT EXISTS seeker_skill_set ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
				e_hash VARCHAR(255) NOT NULL,
                skill_set_name VARCHAR(100) NOT NULL, 
				PRIMARY KEY (id)
                )
				

CREATE TABLE IF NOT EXISTS seeker_bookmarks ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
				e_hash VARCHAR(255) NOT NULL,
                job_id INT(11) NOT NULL, 
				datesaved DATETIME NOT NULL,
				PRIMARY KEY (id)
                )
				
				
CREATE TABLE IF NOT EXISTS company_profile ( 
                company_account_id INT(11) NOT NULL,
				e_hash VARCHAR(255) NOT NULL,
				company_name VARCHAR(100) NOT NULL,
                business_stream_name VARCHAR(255) NOT NULL,
                company_website_url VARCHAR(255) NULL,
				last_checks_rjobs DATETIME NOT NULL,
                PRIMARY KEY (company_account_id),
				UNIQUE KEY company_account_id (company_account_id,e_hash)				
                )
				
				
CREATE TABLE IF NOT EXISTS education_detail (
              id INT(11) NOT NULL AUTO_INCREMENT,
			  e_hash VARCHAR(255) NOT NULL,
			  certificate_degree_name VARCHAR(50) NULL,
			  major VARCHAR(100) NULL,
			  institute_university_name VARCHAR(100) NULL,
			  starting_date INT NOT NULL,
			  completion_date INT NULL,
			  cgpa VARCHAR(20) NULL,
			  percentage VARCHAR(20) NULL,
			  postdate DATETIME NOT NULL,
              PRIMARY KEY (id)
             )
			 

CREATE TABLE IF NOT EXISTS experience_detail (
				id INT(11) NOT NULL AUTO_INCREMENT,
				e_hash VARCHAR(255) NOT NULL,
				is_current_job ENUM('0','1') NOT NULL DEFAULT '0',
				job_title VARCHAR(100) NOT NULL,
				job_specialization VARCHAR(255) NOT NULL,
				company_name VARCHAR(100) NOT NULL,
				business_stream VARCHAR(255) NOT NULL,
				start_date DATE NOT NULL,
			    date_date DATE NOT NULL,
			    date_year_diff INT(11) NOT NULL,
				description TEXT NOT NULL,
				postdate DATETIME NOT NULL,
				PRIMARY KEY (id)
             )
			 

CREATE TABLE IF NOT EXISTS job_post ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
                company_id VARCHAR(100) NOT NULL,
				job_type VARCHAR(50) NOT NULL,
				created_date DATETIME NOT NULL,
				deadline_date DATETIME NOT NULL,
				deadline_mhs VARCHAR(10) NOT NULL,
                job_title VARCHAR(100) NOT NULL,
                job_description TEXT NOT NULL,
				region VARCHAR(50) NOT NULL,
				qualification VARCHAR(255) NOT NULL,
				is_active ENUM('0','1') NOT NULL DEFAULT '0',
				shortlist_limit INT(11) NOT NULL,
				edit_elapsed ENUM('0','1') NOT NULL DEFAULT '0',
				time_elapsed DATETIME NOT NULL,
                PRIMARY KEY (id)
                )
				

CREATE TABLE IF NOT EXISTS job_post_skill_set ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
                job_post_id INT(11) NOT NULL,
				skill_set_name VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
                )
				

CREATE TABLE IF NOT EXISTS job_post_activity ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
				e_hash VARCHAR(255) NOT NULL,
                job_post_id INT(11) NOT NULL,
                apply_date DATETIME NOT NULL,
				seeker_profile_strength INT(11) NOT NULL,
				skill_match INT(11) NOT NULL,
				degree_match INT(11) NOT NULL,
				industry_xp INT(11) NOT NULL,
				seeker_result INT(11) NOT NULL,
                PRIMARY KEY (id)
                )
				
				
CREATE TABLE IF NOT EXISTS notifications ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
				note_type ENUM('a','s','r','o') NOT NULL,
                e_hash VARCHAR(255) NOT NULL,
                initiator_hash VARCHAR(255) NOT NULL,
				job_post_id INT(11) NOT NULL,
                note TEXT NOT NULL,
                did_read ENUM('0','1') NOT NULL DEFAULT '0',
                date_time DATETIME NOT NULL,
                PRIMARY KEY (id) 
                )				
				

CREATE TABLE IF NOT EXISTS feedback ( 
                id INT(11) NOT NULL AUTO_INCREMENT,
				e_hash VARCHAR(255) NOT NULL,
				xp ENUM('g','a','b') NOT NULL DEFAULT 'g',
                PRIMARY KEY (id)
                )
