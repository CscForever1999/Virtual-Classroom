use project;

create table adminrec(
		uname varchar(50),
        password varchar(100)
);

create table approvedstudent(
		sid varchar(20) primary key,
        sname varchar(50),
        uname varchar(30),
        password varchar(30),
        dob varchar(20),
        gender varchar(10),
        permAddr varchar(100),
        presentAddr varchar(100),
        phn varchar(15),
        mob varchar(15),
        escore int,
        batch varchar(10),
        stream varchar(30)
);

create table assignments(
		ano int primary key references setassignment(qno),
        sid varchar(20),
        fname varchar(50),
        fileloc varchar(200),
        dt varchar(20)
);

create table attendance(
		sid varchar(20) references approvedstudent(sid),
        sname varchar(50) references approvedstudent(sname),
        atd float
);

create table batch(
		bname varchar(20) primary key,
        semester varchar(15),
        nextupdatedate date
);

create table exam(
		subject varchar(30),
        noq int
);

create table examresult(
		eno int,
        batch varchar(20),
        sid varchar(20),
        subject varchar(50),
        result int
);

create table facultyrec(
		fid varchar(20) primary key,
        fname varchar(50),
        uname varchar(30),
        password varchar(30),
        dob varchar(20),
        gender varchar(10),
        permaddr varchar(100),
        presentaddr varchar(100),
        phn varchar(15),
        mob varchar(15),
        email varchar(50),
        subject varchar(30),
        qualification varchar(30),
        college varchar(50)
);

create table material(
		mno int primary key auto_increment,
        bname varchar(20) references batch(bname),
        fileloc varchar(1000),
        fid varchar(20)
);

create table notebook(
		sid varchar(20) references approvedstudent(sid),
        data blob
);

create table notice(
		id int primary key auto_increment,
        batch varchar(20) not null references batch(bname),
        msg varchar(10000),
        fileloc varchar(500)
);

create table querymsg(
		name varchar(50),
        mailed varchar(100),
        message varchar(10000)
);

create table question(
		qid int primary key auto_increment,
        weight int(1),
        semester varchar(15),
        subject varchar(30) references exam(subject),
        question varchar(200),
        op1 varchar(50),
        op2 varchar(50),
        op3 varchar(50),
        op4 varchar(50),
        answer int(1),
        noc int,
        tot int,
        percentage float,
        topic varchar(40)
);

create table setassignment(
		qno int primary key,
        batch varchar(20) references batch(bname),
        question varchar(5000),
        solution varchar(1000),
        teacher varchar(50),
        subject varchar(50)
);

create table setexamrecord(
		eno int,
        sid varchar(20),
        subject varchar(50) references exam(subject),
        expirydate date
);

create table studentrec(
		sid varchar(20) primary key,
        sname varchar(50),
        uname varchar(30),
        password varchar(30),
        dob varchar(20),
        gender varchar(10),
        permAddr varchar(100),
        presentAddr varchar(100),
        phn varchar(15),
        mob varchar(15),
        email varchar(50),
        escore int,
        batch varchar(10),
        stream varchar(100)
);

create table subjects(
		scode varchar(10) primary key,
        sname varchar(50),
        semester varchar(15)
);

create table temp(
		assno int default 1,
        examno int default 1
);

create table tempfaculty(
		fid varchar(20) primary key,
        fname varchar(50),
        uname varchar(30),
        password varchar(30),
        dob varchar(20),
        gender varchar(10),
        permaddr varchar(100),
        presentaddr varchar(100),
        phn varchar(15),
        mob varchar(15),
        email varchar(50),
        subject varchar(30),
        qualification varchar(30),
        college varchar(50)
);

create table unviewednotification(
		heading varchar(30),
        message varchar(30),
        tag varchar(30),
        sid varchar(20)
);

create table viewednotification(
		heading varchar(30),
        message varchar(30),
        tag varchar(30),
        sid varchar(20)
);