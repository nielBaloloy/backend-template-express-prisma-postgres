/*
  Warnings:

  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserAccount` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "public"."User" DROP CONSTRAINT "User_userAccountId_fkey";

-- DropForeignKey
ALTER TABLE "public"."User" DROP CONSTRAINT "User_userRoleId_fkey";

-- DropTable
DROP TABLE "public"."Role";

-- DropTable
DROP TABLE "public"."User";

-- DropTable
DROP TABLE "public"."UserAccount";

-- CreateTable
CREATE TABLE "public"."users" (
    "id" SMALLSERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT,
    "age" SMALLINT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "suffixName" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "userAccountId" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."userAccount" (
    "id" SMALLSERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "userAccount_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."users" ADD CONSTRAINT "users_userAccountId_fkey" FOREIGN KEY ("userAccountId") REFERENCES "public"."userAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
