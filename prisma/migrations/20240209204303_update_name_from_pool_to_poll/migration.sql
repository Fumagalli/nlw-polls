/*
  Warnings:

  - You are about to drop the column `poolId` on the `PoolOption` table. All the data in the column will be lost.
  - You are about to drop the `Pool` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `pollId` to the `PoolOption` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "PoolOption" DROP CONSTRAINT "PoolOption_poolId_fkey";

-- AlterTable
ALTER TABLE "PoolOption" DROP COLUMN "poolId",
ADD COLUMN     "pollId" TEXT NOT NULL;

-- DropTable
DROP TABLE "Pool";

-- CreateTable
CREATE TABLE "Poll" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Poll_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PoolOption" ADD CONSTRAINT "PoolOption_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "Poll"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
