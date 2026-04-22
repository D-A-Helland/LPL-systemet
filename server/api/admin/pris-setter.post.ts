import { prisma } from '~/../server/utils/prisma'
import { requireAdmin } from '~/../server/utils/auth'

export default defineEventHandler(async (event) => {
    const admin = await requireAdmin(event)

    const body = await readBody(event)
    const { spiller_id, pris } = body

    if (!spiller_id || !pris) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Missing data'
        })
    }

    const result = await prisma.spiller_priser.create({
        data: {
            spiller_id,
            pris
        }
    })

    return result
})