import { prisma } from '../utils/prisma'

export default defineEventHandler(async () => {
    return await prisma.$queryRaw`
    SELECT b.id AS id,b.navn,s.ganger_solgt,l.navn AS lagnavn,sp.pris FROM brukere AS b
    INNER JOIN spillere AS s ON b.spiller_id = s.id
    INNER JOIN "lag" AS l ON s.lag_id = l.id
        LEFT JOIN LATERAL (
	    SELECT pris FROM spiller_priser AS p
	    WHERE p.spiller_id = s.id
	    ORDER BY created_at DESC
	    LIMIT 1
    ) sp ON TRUE
    ORDER BY lagnavn;
  `
})
