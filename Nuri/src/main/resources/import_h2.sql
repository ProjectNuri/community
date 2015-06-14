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
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('자유게시판', 4, 2, '/board', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('자료실', 4, 3, '/board', NOW(), NOW());
INSERT INTO Menu(name, parentId, sequency, link, createdDate, modifiedDate) VALUES ('문의게시판', 4, 4, '/board', NOW(), NOW());


INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('안녕하십니까?', NOW(), NOW(), 1, '안녕하세요. 내용입니다.', 'http://i.imgur.com/UnG2nyG.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 1, '테스트중입니다.', 'http://i.imgur.com/CoL8p96.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 1, '마바사아자차', 'http://i.imgur.com/0MbMKYt.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('안녕하십니까?', NOW(), NOW(), 2, '안녕하세요. 내용입니다.', 'http://i.imgur.com/5iTTMpN.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 2, '테스트중입니다.', 'http://i.imgur.com/q4JrRIq.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 2, '마바사아자차', 'http://i.imgur.com/PDO045X.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('안녕하십니까?', NOW(), NOW(), 3, '안녕하세요. 내용입니다.', 'http://i.imgur.com/YKliAPD.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 3, '테스트중입니다.', 'http://i.imgur.com/X4AUJbE.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 3, '마바사아자차', 'http://i.imgur.com/KrtOHF5.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('안녕하십니까?', NOW(), NOW(), 4, '안녕하세요. 내용입니다.', 'http://i.imgur.com/mIcamEx.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 4, '테스트중입니다.', 'http://i.imgur.com/95tL1pt.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 4, '마바사아자차', 'http://i.imgur.com/qFbj2rO.png', 1234321, 3455, 345);

INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 3, '테스트중입니다.', 'http://i.imgur.com/X4AUJbE.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 3, '마바사아자차', 'http://i.imgur.com/95tL1pt.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('안녕하십니까?', NOW(), NOW(), 4, '안녕하세요. 내용입니다.', 'http://i.imgur.com/UnG2nyG.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('테스트', NOW(), NOW(), 4, '테스트중입니다.', 'http://i.imgur.com/0MbMKYt.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 4, '마바사아자차', 'http://i.imgur.com/CoL8p96.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 4, '마바사아자차', 'http://i.imgur.com/0MbMKYt.jpg', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 4, '마바사아자차', 'http://i.imgur.com/5iTTMpN.png', 1234321, 3455, 345);
INSERT INTO Content(name, createdDate, modifiedDate, boardId, description, thumbnailUrl, views, likes, favorites) VALUES ('가나다라', NOW(), NOW(), 4, '마바사아자차', 'http://i.imgur.com/PDO045X.png', 1234321, 3455, 345);

INSERT INTO Tag(name, createdDate, modifiedDate) VALUES ('컴퓨터', NOW(), NOW());
INSERT INTO Tag(name, createdDate, modifiedDate) VALUES ('ios', NOW(), NOW());
INSERT INTO Tag(name, createdDate, modifiedDate) VALUES ('css', NOW(), NOW());
INSERT INTO Tag(name, createdDate, modifiedDate) VALUES ('java', NOW(), NOW());

insert into ContentTag (name, contentId, tagId, createdDate, modifiedDate) values ('', 1, 1 ,NOW(), NOW());
insert into ContentTag (name, contentId, tagId, createdDate, modifiedDate) values ('', 1, 2 ,NOW(), NOW());
insert into ContentTag (name, contentId, tagId, createdDate, modifiedDate) values ('', 1, 3 ,NOW(), NOW());
insert into ContentTag (name, contentId, tagId, createdDate, modifiedDate) values ('', 2, 1 ,NOW(), NOW());

insert into User(name,password,nickname,email,phone,createdDate, modifiedDate) values('ehnawh','ghksgml','이환희','ehnawh@gmail.com','010-5246-3043',NOW(),NOW());
insert into User(name,password,nickname,email,phone,createdDate, modifiedDate) values('hsw93','tjddnr','허성욱','hsw93@gmail.com','010-4310-4728 ',NOW(),NOW());
