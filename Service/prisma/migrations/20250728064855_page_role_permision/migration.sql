-- AlterTable
ALTER TABLE "public"."userAccount" ADD COLUMN     "userRoleId" INTEGER;

-- AlterTable
ALTER TABLE "public"."users" ADD COLUMN     "roleId" INTEGER;

-- CreateTable
CREATE TABLE "public"."Role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Page" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Page_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."PagePermission" (
    "id" SERIAL NOT NULL,
    "roleId" INTEGER NOT NULL,
    "pageId" INTEGER NOT NULL,
    "canRead" BOOLEAN NOT NULL DEFAULT false,
    "canWrite" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PagePermission_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "public"."Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Page_name_key" ON "public"."Page"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PagePermission_roleId_pageId_key" ON "public"."PagePermission"("roleId", "pageId");

-- AddForeignKey
ALTER TABLE "public"."users" ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "public"."Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."userAccount" ADD CONSTRAINT "userAccount_userRoleId_fkey" FOREIGN KEY ("userRoleId") REFERENCES "public"."Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PagePermission" ADD CONSTRAINT "PagePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "public"."Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PagePermission" ADD CONSTRAINT "PagePermission_pageId_fkey" FOREIGN KEY ("pageId") REFERENCES "public"."Page"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
