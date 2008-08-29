CREATE TABLE "Apps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL, "wait_wav" varchar(255) DEFAULT NULL, "app_human" varchar(255) DEFAULT NULL, "app_machine" varchar(255) DEFAULT NULL, "account_id" integer DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL, "calls_per_minute" integer, "app_beep" varchar(255), "start_url" varchar(255), "fields" varchar(255));
CREATE TABLE "accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE TABLE contacts ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255) DEFAULT NULL, "last_name" varchar(255) DEFAULT NULL, "email" varchar(255) DEFAULT NULL, "phone" varchar(255) DEFAULT NULL, "cell" varchar(255) DEFAULT NULL, "address1" varchar(255) DEFAULT NULL, "address2" varchar(255) DEFAULT NULL, "city" varchar(255) DEFAULT NULL, "state" varchar(255) DEFAULT NULL, "country" varchar(255) DEFAULT NULL, "post_code" varchar(255) DEFAULT NULL, "time_zone" varchar(255) DEFAULT NULL, "account_id" varchar(255) DEFAULT NULL, "tags" varchar(255) DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL, "custom0" varchar(255), "custom1" varchar(255), "custom2" varchar(255), "custom3" varchar(255), "custom4" varchar(255));
CREATE TABLE "contacts_groups" ("contact_id" integer NOT NULL, "group_id" integer NOT NULL);
CREATE TABLE "contacts_schedules" ("contact_id" integer NOT NULL, "schedule_id" integer NOT NULL);
CREATE TABLE groups ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL, "enabled" boolean DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL);
CREATE TABLE "groups_schedules" ("group_id" integer NOT NULL, "schedule_id" integer NOT NULL);
CREATE TABLE histories ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "schedule_id" integer DEFAULT NULL, "contact_id" integer DEFAULT NULL, "result" varchar(255) DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL);
CREATE TABLE models ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "test" varchar(255) DEFAULT NULL, "test2" integer DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL);
CREATE TABLE "options" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "version" varchar(255) DEFAULT NULL NULL, "mock" boolean DEFAULT NULL NULL, "debug_level" integer DEFAULT NULL NULL, "admin_name" varchar(255) DEFAULT NULL NULL, "admin_email" varchar(255) DEFAULT NULL NULL, "daily_summary" boolean DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "admin_phone" varchar(255), "support_url" varchar(255));
CREATE TABLE "runners" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE TABLE "schedules" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start" datetime DEFAULT NULL NULL, "account_id" integer DEFAULT NULL NULL, "app_id" integer DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "tags" varchar(255), "state" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "schedule_id" integer DEFAULT NULL NULL, "app_id" integer DEFAULT NULL NULL, "start" datetime DEFAULT NULL NULL, "started" boolean DEFAULT NULL NULL, "completed" boolean DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "contact_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(255) DEFAULT NULL NULL, "email" varchar(255) DEFAULT NULL NULL, "crypted_password" varchar(40) DEFAULT NULL NULL, "salt" varchar(40) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "remember_token" varchar(255) DEFAULT NULL NULL, "remember_token_expires_at" datetime DEFAULT NULL NULL, "account_id" integer DEFAULT 0);
CREATE TABLE "utilities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('9');

INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('20080723164436');

INSERT INTO schema_migrations (version) VALUES ('20080723182908');

INSERT INTO schema_migrations (version) VALUES ('20080723191622');

INSERT INTO schema_migrations (version) VALUES ('20080723192008');

INSERT INTO schema_migrations (version) VALUES ('20080723192355');

INSERT INTO schema_migrations (version) VALUES ('20080724142140');

INSERT INTO schema_migrations (version) VALUES ('20080724145241');

INSERT INTO schema_migrations (version) VALUES ('20080724151848');

INSERT INTO schema_migrations (version) VALUES ('20080724160810');

INSERT INTO schema_migrations (version) VALUES ('20080724162047');

INSERT INTO schema_migrations (version) VALUES ('20080724162229');

INSERT INTO schema_migrations (version) VALUES ('20080724172834');

INSERT INTO schema_migrations (version) VALUES ('20080724173000');

INSERT INTO schema_migrations (version) VALUES ('20080724174850');

INSERT INTO schema_migrations (version) VALUES ('20080728180901');

INSERT INTO schema_migrations (version) VALUES ('20080728201407');

INSERT INTO schema_migrations (version) VALUES ('20080729152004');

INSERT INTO schema_migrations (version) VALUES ('20080729170955');

INSERT INTO schema_migrations (version) VALUES ('20080729174648');

INSERT INTO schema_migrations (version) VALUES ('20080729185137');

INSERT INTO schema_migrations (version) VALUES ('20080730160423');

INSERT INTO schema_migrations (version) VALUES ('20080730173210');

INSERT INTO schema_migrations (version) VALUES ('20080730201300');

INSERT INTO schema_migrations (version) VALUES ('20080801221019');

INSERT INTO schema_migrations (version) VALUES ('20080802164951');

INSERT INTO schema_migrations (version) VALUES ('20080804121205');

INSERT INTO schema_migrations (version) VALUES ('20080807125605');