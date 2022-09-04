/*
 Source Server         : localhost - PG
 Source Server Type    : PostgreSQL
 Source Server Version : 130002
 Source Host           : localhost:5432
 Source Catalog        : forum
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130002
 File Encoding         : 65001

 Date: 04/09/2022 16:34:36
*/


-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS "public"."forum";
CREATE TABLE "public"."forum" (
  "id" int4 NOT NULL,
  "forum_date" timestamp(6) NOT NULL,
  "is_available" bool NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int4
)
;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO "public"."forum" VALUES (2, '2022-09-04 11:43:11.916731', 't', 'Test Forum #1', 1);
INSERT INTO "public"."forum" VALUES (12, '2022-09-04 16:15:11.335769', 't', '2', 1);
INSERT INTO "public"."forum" VALUES (13, '2022-09-04 16:15:13.641698', 't', '3', 1);
INSERT INTO "public"."forum" VALUES (14, '2022-09-04 16:15:16.313307', 't', '4', 1);
INSERT INTO "public"."forum" VALUES (15, '2022-09-04 16:15:18.833576', 't', '5', 1);
INSERT INTO "public"."forum" VALUES (16, '2022-09-04 16:15:21.643258', 't', '6', 1);
INSERT INTO "public"."forum" VALUES (17, '2022-09-04 16:15:24.001986', 't', '7', 1);
INSERT INTO "public"."forum" VALUES (18, '2022-09-04 16:15:26.421543', 't', '8', 1);
INSERT INTO "public"."forum" VALUES (19, '2022-09-04 16:15:29.265745', 't', '9', 1);
INSERT INTO "public"."forum" VALUES (20, '2022-09-04 16:15:32.677357', 't', '10', 1);
INSERT INTO "public"."forum" VALUES (21, '2022-09-04 16:15:35.179672', 't', '11', 1);
INSERT INTO "public"."forum" VALUES (22, '2022-09-04 16:15:38.030155', 't', '12', 1);
INSERT INTO "public"."forum" VALUES (23, '2022-09-04 16:15:41.011954', 't', '13', 1);
INSERT INTO "public"."forum" VALUES (24, '2022-09-04 16:15:43.817158', 't', '14', 1);
INSERT INTO "public"."forum" VALUES (25, '2022-09-04 16:15:47.721118', 't', '15', 1);
INSERT INTO "public"."forum" VALUES (26, '2022-09-04 16:15:49.86403', 't', '16', 1);
INSERT INTO "public"."forum" VALUES (27, '2022-09-04 16:15:52.30321', 't', '111', 1);
INSERT INTO "public"."forum" VALUES (28, '2022-09-04 16:15:54.963172', 't', '222', 1);
INSERT INTO "public"."forum" VALUES (29, '2022-09-04 16:15:57.015463', 't', '333', 1);
INSERT INTO "public"."forum" VALUES (30, '2022-09-04 16:15:59.078652', 't', '444', 1);
INSERT INTO "public"."forum" VALUES (31, '2022-09-04 16:16:01.230424', 't', '5555', 1);
INSERT INTO "public"."forum" VALUES (32, '2022-09-04 16:16:03.332471', 't', '6666', 1);
INSERT INTO "public"."forum" VALUES (33, '2022-09-04 16:16:05.799417', 't', '1231231', 1);
INSERT INTO "public"."forum" VALUES (34, '2022-09-04 16:16:07.923171', 't', 'dsadasdsa', 1);
INSERT INTO "public"."forum" VALUES (35, '2022-09-04 16:16:11.347501', 't', 'dsfsfdsf', 1);
INSERT INTO "public"."forum" VALUES (36, '2022-09-04 16:16:14.327498', 't', 'zxczxczxczxc', 1);
INSERT INTO "public"."forum" VALUES (37, '2022-09-04 16:16:16.973979', 't', 'asdasdasdasdas', 1);
INSERT INTO "public"."forum" VALUES (38, '2022-09-04 16:16:20.257284', 't', 'zxczxczc', 1);
INSERT INTO "public"."forum" VALUES (39, '2022-09-04 16:16:22.710643', 't', 'dsdasdada', 1);
INSERT INTO "public"."forum" VALUES (40, '2022-09-04 16:16:24.926348', 't', 'cxzczxczx', 1);
INSERT INTO "public"."forum" VALUES (41, '2022-09-04 16:16:27.447988', 't', 'dasdadsada', 1);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."topic";
CREATE TABLE "public"."topic" (
  "id" int4 NOT NULL,
  "content" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "topic_date" timestamp(6) NOT NULL,
  "forum_id" int4 NOT NULL,
  "is_available" bool NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int4
)
;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO "public"."topic" VALUES (6, 'sdadadasdadasd', '2022-09-04 12:18:14.223649', 2, 't', 'Test topic #1', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "id" int4 NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "gender" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int4 NOT NULL,
  "user_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES (1, 'admin@admin.nl', 'Male', '8cb2237d0679ca88db6464eac60da96345513964', 0, 'admin', 'admin');
INSERT INTO "public"."user" VALUES (7, 'user@user.nl', 'Male', '8cb2237d0679ca88db6464eac60da96345513964', 1, 'user', 'user');
INSERT INTO "public"."user" VALUES (8, 'user2@user.nl', 'Male', '8cb2237d0679ca88db6464eac60da96345513964', 1, 'user2', 'user2');

-- ----------------------------
-- Primary Key structure for table forum
-- ----------------------------
ALTER TABLE "public"."forum" ADD CONSTRAINT "forum_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table topic
-- ----------------------------
ALTER TABLE "public"."topic" ADD CONSTRAINT "topic_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table forum
-- ----------------------------
ALTER TABLE "public"."forum" ADD CONSTRAINT "fknlx0pi0ritye5a2off4r3x8qi" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table topic
-- ----------------------------
ALTER TABLE "public"."topic" ADD CONSTRAINT "fki7bso4w4yd7tynmvg5vbbxhat" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."topic" ADD CONSTRAINT "fkjbo776uy3da7iln995ky5u009" FOREIGN KEY ("forum_id") REFERENCES "public"."forum" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
