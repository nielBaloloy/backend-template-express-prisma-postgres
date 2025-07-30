-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userRoleId" INTEGER;

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "roleName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserAddress" (
    "id" SERIAL NOT NULL,
    "addressType" TEXT,
    "lineAddress" TEXT,
    "regionId" INTEGER,
    "provinceId" INTEGER,
    "cityId" INTEGER,
    "barangayId" INTEGER,
    "zipCode" TEXT,

    CONSTRAINT "UserAddress_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userRoleId_fkey" FOREIGN KEY ("userRoleId") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;
