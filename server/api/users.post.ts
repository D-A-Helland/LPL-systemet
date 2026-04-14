import { prisma } from '../utils/prisma'
import { hashPassword } from '../utils/password'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    const { navn, tlf, epost, password, lag_id } = body

    if (!navn || !epost || !password || !lag_id) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Missing fields'
        })
    }

    const existing = await prisma.brukere.findUnique({
        where: { epost }
    })

    if (existing) {
        throw createError({
            statusCode: 400,
            statusMessage: 'User already exists'
        })
    }

    const hashed = await hashPassword(password)

    const result = await prisma.$transaction(async (tx) => {
        const spiller = await tx.spillere.create({
            data: {
                lag_id: Number(lag_id),
                ganger_solgt: 0
            }
        })

        const user = await tx.brukere.create({
            data: {
                navn,
                tlf,
                epost,
                passord_hash: hashed,
                spiller_id: spiller.id
            }
        })

        return { user, spiller }
    })

})