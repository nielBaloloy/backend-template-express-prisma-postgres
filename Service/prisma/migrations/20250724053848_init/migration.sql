/*
  Warnings:

  - Made the column `Age` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userAccountId" INTEGER,
ALTER COLUMN "Age" SET NOT NULL;

-- CreateTable
CREATE TABLE "UserAccount" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "UserAccount_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserAccount_email_key" ON "UserAccount"("email");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userAccountId_fkey" FOREIGN KEY ("userAccountId") REFERENCES "UserAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
