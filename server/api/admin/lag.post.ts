import { prisma } from '../../utils/prisma'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    const { navn, klasse } = body

    if (!navn || !klasse) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Missing fields'
        })
    }

    const existing = await prisma.lag.findFirst({
        where: { navn }
    })

    if (existing) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Laget finnes allerede'
        })
    }


    const user = await prisma.lag.create({
        data: {
            navn,
            klasse
        }
    })
    console.log(user)
    return { user }
})