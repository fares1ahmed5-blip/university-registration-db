create table FACULTY (
    FacultyCode number PRIMARY KEY,
    FacultyName varchar2(50) NOT NULL UNIQUE
);

create table MAJOR (
    MajorCode   varchar2(10) PRIMARY KEY,
    MajorName   varchar2(100) UNIQUE NOT NULL,
    FacultyCode number,
 constraint fk_major_faculty
        foreign KEY (FacultyCode) 
        references FACULTY(FacultyCode) 
);

create table COURSE (
    MajorCode    varchar2(10),
    CourseNo     varchar2(10), 
    CourseName   varchar2(100),
    CreditHours  number,
     constraint pk_course PRIMARY KEY (MajorCode, CourseNo),
     constraint fk_course_major
        foreign KEY (MajorCode)
        references MAJOR(MajorCode)
);

create table INSTRUCTOR (
    InstId      number PRIMARY KEY,
    Fname       varchar2(50) NOT NULL,
    Lname       varchar2(50) NOT NULL,
    Status      varchar2(20),
    FacultyCode number,
    Salary      number CHECK (Salary BETWEEN 5000 AND 30000),
     constraint fk_instructor_faculty
        FOREIGN KEY (FacultyCode)
        references FACULTY(FacultyCode)
);
create table STUDENT (
    StudentId   number PRIMARY KEY,
    Fname       varchar2(50) NOT NULL,
    Lname       varchar2(50) NOT NULL,
    Gender      CHAR(1) CHECK (Gender IN ('M', 'F')),
    Bdate       DATE,
    StuLevel    CHAR(1) CHECK (StuLevel IN ('1', '2', '3', '4')),
    MajorCode   varchar2(10),
     constraint fk_student_major
        foreign KEY (MajorCode)
        references MAJOR(MajorCode)
);
create table SECTION (
    MajorCode   varchar2(10),
    CourseNo    varchar2(10),
    SectionNo   number,
    Semester    varchar2(10),
    Year        number,
    WeekDay     varchar2(10),
    TimeSlot    varchar2(20),
    InstId      number,
     constraint pk_section PRIMARY KEY 
        (MajorCode, CourseNo, SectionNo, Semester, Year),
     constraint fk_section_course
        foreign KEY (MajorCode, CourseNo)
        references COURSE(MajorCode, CourseNo),
     constraint fk_section_instructor
        foreign KEY (InstId)
        references INSTRUCTOR(InstId)
);
create table TRANSCRIPT (
    StudentId number,
    MajorCode varchar2(10),
    CourseNo varchar2(10),
    SectionNo number,
    Semester varchar2(10),
    Year number,
    Grade number(4,2), 
     constraint pk_transcript PRIMARY KEY
        (StudentId, MajorCode, CourseNo, SectionNo, Semester,Year),
     constraint fk_transcript_student
        FOREIGN KEY (StudentId)
        references STUDENT (StudentId),
     constraint fk_transcript_section
        foreign KEY (MajorCode, CourseNo, SectionNo, Semester,Year)
        references SECTION (MajorCode, CourseNo, SectionNo, Semester,Year)
);


INSERT INTO FACULTY VALUES (101, 'Faculty of Engineering');
INSERT INTO FACULTY VALUES (102, 'Faculty of Medicine');
INSERT INTO FACULTY VALUES (103, 'Faculty of Science');
INSERT INTO FACULTY VALUES (104, 'Faculty of Arts');
INSERT INTO FACULTY VALUES (105, 'Faculty of Commerce');
INSERT INTO FACULTY VALUES (106, 'Faculty of Law');
INSERT INTO FACULTY VALUES (107, 'Faculty of Pharmacy');
INSERT INTO FACULTY VALUES (108, 'Faculty of Education');
INSERT INTO FACULTY VALUES (109, 'Faculty of Computer Science');
INSERT INTO FACULTY VALUES (110, 'Faculty of Dentistry');


INSERT INTO MAJOR VALUES ('ENG', 'Engineering', 101);
INSERT INTO MAJOR VALUES ('MED', 'Medicine', 102);
INSERT INTO MAJOR VALUES ('SCI', 'Science', 103);
INSERT INTO MAJOR VALUES ('ART', 'Arts', 104);
INSERT INTO MAJOR VALUES ('BUS', 'Business', 105);
INSERT INTO MAJOR VALUES ('LAW', 'Law', 106);
INSERT INTO MAJOR VALUES ('PHARM', 'Pharmacy', 107);
INSERT INTO MAJOR VALUES ('EDU', 'Education', 108);
INSERT INTO MAJOR VALUES ('CS', 'Computer Science', 109);
INSERT INTO MAJOR VALUES ('DEN', 'Dentistry', 110);

INSERT INTO COURSE VALUES ('ENG', 'ENG101', 'Intro to Engineering', 3);
INSERT INTO COURSE VALUES ('ENG', 'ENG201', 'Engineering Mechanics', 3);
INSERT INTO COURSE VALUES ('MED', 'MED101', 'Human Anatomy', 4);
INSERT INTO COURSE VALUES ('SCI', 'SCI101', 'Physics I', 4);
INSERT INTO COURSE VALUES ('ART', 'ART101', 'History of Art', 3);
INSERT INTO COURSE VALUES ('BUS', 'BUS101', 'Business Management', 3);
INSERT INTO COURSE VALUES ('LAW', 'LAW101', 'Constitutional Law', 3);
INSERT INTO COURSE VALUES ('PHARM', 'PHARM101', 'Pharmacy Basics', 3);
INSERT INTO COURSE VALUES ('CS', 'CS101', 'Programming I', 3);
INSERT INTO COURSE VALUES ('DEN', 'DEN101', 'Dental Anatomy', 4);


INSERT INTO INSTRUCTOR VALUES (201, 'Ahmed', 'Ali', 'Full-time', 101, 20000);
INSERT INTO INSTRUCTOR VALUES (202, 'Fatima', 'Mohamed', 'Full-time', 102, 22000);
INSERT INTO INSTRUCTOR VALUES (203, 'Omar', 'Hassan', 'Part-time', 103, 15000);
INSERT INTO INSTRUCTOR VALUES (204, 'Sara', 'Khalid', 'Full-time', 104, 18000);
INSERT INTO INSTRUCTOR VALUES (205, 'Youssef', 'Samir', 'Part-time', 105, 16000);
INSERT INTO INSTRUCTOR VALUES (206, 'Laila', 'Adel', 'Full-time', 106, 21000);
INSERT INTO INSTRUCTOR VALUES (207, 'Mona', 'Fahmy', 'Full-time', 107, 23000);
INSERT INTO INSTRUCTOR VALUES (208, 'Tamer', 'Ibrahim', 'Part-time', 108, 14000);
INSERT INTO INSTRUCTOR VALUES (209, 'Nour', 'Youssef', 'Full-time', 109, 25000);
INSERT INTO INSTRUCTOR VALUES (210, 'Amina', 'Said', 'Part-time', 110, 17000);


INSERT INTO STUDENT VALUES (1001, 'Ali', 'Hassan', 'M', DATE '2000-01-10', '1', 'ENG');
INSERT INTO STUDENT VALUES (1002, 'Sara', 'Mohamed', 'F', DATE '1999-05-22', '2', 'MED');
INSERT INTO STUDENT VALUES (1003, 'Omar', 'Khalid', 'M', DATE '2001-03-15', '3', 'SCI');
INSERT INTO STUDENT VALUES (1004, 'Laila', 'Fahmy', 'F', DATE '2000-12-30', '4', 'ART');
INSERT INTO STUDENT VALUES (1005, 'Youssef', 'Samir', 'M', DATE '1998-07-05', '2', 'BUS');
INSERT INTO STUDENT VALUES (1006, 'Mona', 'Adel', 'F', DATE '2001-09-17', '1', 'LAW');
INSERT INTO STUDENT VALUES (1007, 'Hany', 'Ibrahim', 'M', DATE '1999-11-03', '3', 'PHARM');
INSERT INTO STUDENT VALUES (1008, 'Nada', 'Omar', 'F', DATE '2000-06-22', '2', 'EDU');
INSERT INTO STUDENT VALUES (1009, 'Tamer', 'Youssef', 'M', DATE '2001-02-14', '1', 'CS');
INSERT INTO STUDENT VALUES (1010, 'Rania', 'Said', 'F', DATE '1999-08-30', '4', 'DEN');

INSERT INTO SECTION VALUES ('ENG', 'ENG101', 1, 'Spring', 2023, 'Monday', '08:00-10:00', 201);
INSERT INTO SECTION VALUES ('ENG', 'ENG201', 1, 'Spring', 2023, 'Tuesday', '10:00-12:00', 201);
INSERT INTO SECTION VALUES ('MED', 'MED101', 1, 'Spring', 2023, 'Wednesday', '09:00-11:00', 202);
INSERT INTO SECTION VALUES ('SCI', 'SCI101', 1, 'Spring', 2023, 'Thursday', '13:00-15:00', 203);
INSERT INTO SECTION VALUES ('ART', 'ART101', 1, 'Spring', 2023, 'Friday', '10:00-12:00', 204);
INSERT INTO SECTION VALUES ('BUS', 'BUS101', 1, 'Spring', 2023, 'Monday', '14:00-16:00', 205);
INSERT INTO SECTION VALUES ('LAW', 'LAW101', 1, 'Spring', 2023, 'Tuesday', '12:00-14:00', 206);
INSERT INTO SECTION VALUES ('PHARM', 'PHARM101', 1, 'Spring', 2023, 'Wednesday', '08:00-10:00', 207);
INSERT INTO SECTION VALUES ('CS', 'CS101', 1, 'Spring', 2023, 'Thursday', '10:00-12:00', 209);
INSERT INTO SECTION VALUES ('DEN', 'DEN101', 1, 'Spring', 2023, 'Frida', '16:00-18:00', 210);

INSERT INTO TRANSCRIPT VALUES (1001, 'ENG', 'ENG101', 1, 'Spring', 2023, 88.5);
INSERT INTO TRANSCRIPT VALUES (1002, 'MED', 'MED101', 1, 'Spring', 2023, 92.0);
INSERT INTO TRANSCRIPT VALUES (1003, 'SCI', 'SCI101', 1, 'Spring', 2023, 79.5);
INSERT INTO TRANSCRIPT VALUES (1004, 'ART', 'ART101', 1, 'Spring', 2023, 85.0);
INSERT INTO TRANSCRIPT VALUES (1005, 'BUS', 'BUS101', 1, 'Spring', 2023, 91.0);
INSERT INTO TRANSCRIPT VALUES (1006, 'LAW', 'LAW101', 1, 'Spring', 2023, 82.5);
INSERT INTO TRANSCRIPT VALUES (1007, 'PHARM','PHARM101', 1,'Spring', 2023, 87.0);
INSERT INTO TRANSCRIPT VALUES (1008, 'EDU', 'ART102', 1,'Spring', 2023, 90.0);
INSERT INTO TRANSCRIPT VALUES (1009, 'CS', 'CS101', 1, 'Spring', 2023, 93.0);
INSERT INTO TRANSCRIPT VALUES (1010, 'DEN', 'DEN101', 1,'Spring', 2023, 86.5);


select * FROM student;
    
   
       
      
select *
from faculty
ORDER BY facultycode DESC;

 
select *
FROM student
WHERE gender ='m';
       
  
   select *
   FROM student
   WHERE gender='f'
   AND months_between(sysdate,bdate)>150;
       
       
   
  SELECT *
  from  instructor
  where salary BETWEEN 15000 and 17550;
       
     
  select*
   from instructor
  where salary in (1000,5000,8000,15000);
       
     
  select fname||' '||lname ,majorcode
  from student
  where majorcode is NOT null;
       
      
  SELECT count(semester)
  from section 
  where instid = null;
  
    
  SELECT sum(salary)
   from instructor
  where facultycode =210;
       
       
    select *
   from student
   where  'level' ='4'
   order by lname asc ;
    
    
   select StudentId, Fname||' '||Lname 
   from STUDENT
   where 'level'='4'
   and gender='m';
       
       
    select studentid,fname
    from student
    where bdate = null;
      
      
     
   select*
   from STUDENT
   ORDER BY 'level' ASC, lname ASC;
       
 
   SELECT*
   FROM section
   where semester='spring'
   and year=2020;
   
    
   select *
   from student
   order by 'level' DESC,fname ASC;
   
    
   select *
   from section
   where semester='spring'
   and year=2020
   and instid = null;
   
   
     
   select *
   from student
   where fname like 'Moh%'
   and lname like '%sh';
   select *
   from student
   where bdate is not null;
   
   
 select salary*1.10,instid
 from instructor;
   
   
   

select SUM(Salary) , SUM(Salary*1.15) 
FROM INSTRUCTOR
where FacultyCode = 220;  
   
  
  
  
  
 select Fname, Lname
 from INSTRUCTOR
WHERE FacultyCode = 1010
AND InstId NOT IN (
SELECT InstId FROM SECTION WHERE Semester='Spring' AND Year=2020
);
  
  
   
 select MajorCode
 from STUDENT
GROUP BY MajorCode
having COUNT(*) < 20;
   
   
   
 select  COUNT(StudentId),MajorCode, CourseNo, SectionNo, Year, Grade
FROM TRANSCRIPT
where Year IN (2019,2020)
group BY MajorCode, CourseNo, SectionNo, Year, Grade;
    
    
    
 SELECT fname ||' '||lname asfullname
 FROM  student;
   
   
   
  select upper(fname) ||' '||lower(lname)asfullname
  from student;
   
select SUBSTR(Fname,1,3) , SUBSTR(Fname,-3,3) 
 from STUDENT;
   
   
   select *
    from student
WHERE fname like 'A%';
   
   
   select *
    from student
where length(Lname) > 5;
   
   
   
select 'Level', COUNT(studentid)
 from student
group by 'Level';
   
   
  select MajorCode,count(StudentID)
from student
group by MajorCode; 
SELECT MAX(Salary), MIN(Salary) 
from INSTRUCTOR;  
    
    
      
select Status, AVG(Salary) 
FROM INSTRUCTOR
group BY Status;


select MajorCode, COUNT (MajorCode)
 from COURSE
group by MajorCode;
     
     
     
 select count (MajorCode),courseno
 from SECTION
group by CourseNo;
        
      
 SELECT MajorCode, CourseNo, AVG(Grade)
 from TRANSCRIPT
group BY MajorCode, CourseNo;       
        
        
        
 select CourseNo, Year, COUNT( StudentId)  
FROM TRANSCRIPT
group BY CourseNo, Year;  
SELECT MajorCode, SUM(CreditHours) 
 from COURSE
group BY MajorCode;   
        
      
SELECT StudentId, MAX(Grade) 
 from TRANSCRIPT
GROUP by StudentId;     
        
      
select majorcode,courseno
from transcript
group by majorcode,courseno 
having avg(grade) > 80 ;