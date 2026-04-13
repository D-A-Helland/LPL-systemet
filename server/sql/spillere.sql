SELECT b.navn,b.rolle,b.tlf,b.epost,b.passord_hash,s.ganger_solgt,l.navn AS lagnavn,sp.pris FROM brukere AS b
INNER JOIN spillere AS s ON b.spiller_id = s.id
INNER JOIN "lag" AS l ON s.lag_id = l.id
LEFT JOIN LATERAL (
	SELECT pris FROM spiller_priser AS p
	WHERE p.spiller_id = s.id
	ORDER BY created_at DESC
	LIMIT 1
) sp ON TRUE;