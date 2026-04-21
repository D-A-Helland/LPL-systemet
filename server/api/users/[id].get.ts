import { prisma } from '../../utils/prisma'
import type { H3Event } from 'h3'

export default defineEventHandler(async (event: H3Event) => {
  const id = Number(getRouterParam(event, 'id'))

  const user = await prisma.brukere.findUnique({
    where: { id },
    select: {
      id: true,
      navn: true,
      // add fields you want to show
    },
  })

  if (!user) {
    throw createError({
      statusCode: 404,
      statusMessage: 'User not found',
    })
  }

  return user
})
