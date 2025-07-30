/*
  Warnings:

  - Added the required column `accountId` to the `userAccount` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."userAccount" ADD COLUMN     "accountId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "public"."Address" (
    "id" SERIAL NOT NULL,
    "region" TEXT,
    "province" TEXT,
    "municipality" TEXT,
    "barangay" TEXT,
    "floor_unit" TEXT,
    "zipcode" INTEGER,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."AuditLogs" (
    "id" SERIAL NOT NULL,
    "action" TEXT,
    "module" TEXT,
    "logTimeDate" TIMESTAMP(3),
    "accountId" INTEGER,

    CONSTRAINT "AuditLogs_pkey" PRIMARY KEY ("id")
);
