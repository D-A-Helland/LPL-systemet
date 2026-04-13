import { prisma } from '../utils/prisma'

export default defineEventHandler(async () => {
    const users = await prisma.brukere.findMany()
    return users
})