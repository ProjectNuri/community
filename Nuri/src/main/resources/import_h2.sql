INSERT INTO Board(name, createdDate, modifiedDate) VALUES ('공지사항', NOW(), NOW());
INSERT INTO Board(name, createdDate, modifiedDate) VALUES ('자유게시판', NOW(), NOW());
INSERT INTO Board(name, createdDate, modifiedDate) VALUES ('자료실', NOW(), NOW());
INSERT INTO Board(name, createdDate, modifiedDate) VALUES ('문의게시판', NOW(), NOW());

INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('Home', null, 1, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('About', null, 2, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('Contact', null, 3, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('Boards', null, 4, '/board', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('Welcome', 1, 1, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('메인', 1, 1, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('하하', 2, 1, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('호호', 2, 2, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('하하', 3, 1, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('호호', 3, 2, '#', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('공지사항', 4, 1, '/board', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('자유게시판', 4, 2, '/board', NOW(), NOW());ㅓㄴ택함

INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('자료실', 4, 3, '/board', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('문의게시판', 4, 4, '/board', NOW(), NOW());


INSERT INTO Content(name, createdDate, modifiedDate, boardId, contents) VALUES ('안녕하십니까?', NOW(), NOW(), 1, '안녕하세요. 내용입니다.');
INSERT INTO Content(name, createdDate, modifiedDate, boardId, contents) VALUES ('테스트', NOW(), NOW(), 1, '테스트중입니다.');
INSERT INTO Content(name, createdDate, modifiedDate, boardId, contents) VALUES ('가나다라', NOW(), NOW(), 1, '마바사아자차');

insert into User(name,password,nickname,email,phone,createdDate, modifiedDate) values('ehnawh','ghksgml','이환희','ehnawh@gmail.com','010-5246-3043',NOW(),NOW())
insert into User(name,password,nickname,email,phone,createdDate, modifiedDate) values('hsw93','tjddnr','허성욱','hsw93@gmail.com','010-4310-4728 ',NOW(),NOW())