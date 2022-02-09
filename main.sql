-- Adminer 4.8.1 PostgreSQL 13.5 dump

DROP TABLE IF EXISTS "company";
CREATE TABLE "public"."company" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "isin" character varying(255) NOT NULL,
    "employees" integer NOT NULL,
    CONSTRAINT "company_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "company" ("id", "name", "isin", "employees") VALUES
(1,	'Sony',	'JP3435000009',	109700),
(2,	'Microsoft',	'US5949181045',	189984),
(3,	'Nintendo',	'JP3756600007',	6547);

DROP TABLE IF EXISTS "doctrine_migration_versions";
CREATE TABLE "public"."doctrine_migration_versions" (
    "version" character varying(191) NOT NULL,
    "executed_at" timestamp(0),
    "execution_time" integer,
    CONSTRAINT "doctrine_migration_versions_pkey" PRIMARY KEY ("version")
) WITH (oids = false);

INSERT INTO "doctrine_migration_versions" ("version", "executed_at", "execution_time") VALUES
('DoctrineMigrations\Version20220208130429',	'2022-02-08 13:04:33',	69);

DROP TABLE IF EXISTS "game";
CREATE TABLE "public"."game" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "price" double precision NOT NULL,
    CONSTRAINT "game_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "game" ("id", "name", "price") VALUES
(1,	'The Last of Us Remastered',	19.99);

DROP TABLE IF EXISTS "game_platform";
CREATE TABLE "public"."game_platform" (
    "game_id" integer NOT NULL,
    "platform_id" integer NOT NULL,
    CONSTRAINT "game_platform_pkey" PRIMARY KEY ("game_id", "platform_id")
) WITH (oids = false);

CREATE INDEX "idx_92162fede48fd905" ON "public"."game_platform" USING btree ("game_id");

CREATE INDEX "idx_92162fedffe6496f" ON "public"."game_platform" USING btree ("platform_id");

INSERT INTO "game_platform" ("game_id", "platform_id") VALUES
(1,	1);

DROP TABLE IF EXISTS "platform";
CREATE TABLE "public"."platform" (
    "id" integer NOT NULL,
    "company_id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "price" double precision NOT NULL,
    CONSTRAINT "platform_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "idx_3952d0cb979b1ad6" ON "public"."platform" USING btree ("company_id");

INSERT INTO "platform" ("id", "company_id", "name", "price") VALUES
(1,	1,	'PlayStation 4',	300);

ALTER TABLE ONLY "public"."game_platform" ADD CONSTRAINT "fk_92162fede48fd905" FOREIGN KEY (game_id) REFERENCES game(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."game_platform" ADD CONSTRAINT "fk_92162fedffe6496f" FOREIGN KEY (platform_id) REFERENCES platform(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."platform" ADD CONSTRAINT "fk_3952d0cb979b1ad6" FOREIGN KEY (company_id) REFERENCES company(id) NOT DEFERRABLE;

-- 2022-02-08 19:00:47.505318+00
