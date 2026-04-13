CREATE TABLE IF NOT EXISTS lag(
    id SERIAL PRIMARY KEY,
    navn TEXT NOT NULL,
    klasse TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS spillere(
    id SERIAL PRIMARY KEY,
    ganger_solgt INTEGER DEFAULT 0,
    lag_id INTEGER,
    CONSTRAINT spiller_lag
        FOREIGN KEY (lag_id)
        REFERENCES lag(id)
        ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS brukere (
    id SERIAL PRIMARY KEY,
    navn TEXT NOT NULL,
    rolle TEXT NOT NULL DEFAULT 'spiller',
    CONSTRAINT gyldig_rolle CHECK (
        rolle IN ('admin', 'manager', 'spiller')),
    tlf TEXT UNIQUE,
    epost TEXT UNIQUE NOT NULL,
    passord_hash TEXT NOT NULL,
    spiller_id INTEGER NOT NULL,
    CONSTRAINT spiller_bruker
        FOREIGN KEY (spiller_id)
        REFERENCES spillere(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS spiller_priser(
    id SERIAL PRIMARY KEY,
    pris INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    spiller_id INTEGER NOT NULL,
    CONSTRAINT spiller_pris
        FOREIGN KEY (spiller_id)
        REFERENCES spillere(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS kamp_oppstillinger(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lag_id INTEGER,
    CONSTRAINT lag_oppstilling
        FOREIGN KEY (lag_id)
        REFERENCES lag(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS spiller_oppstillinger(
    id SERIAL PRIMARY KEY,
    spillepris INTEGER NOT NULL,
    oppstilling_id INTEGER NOT NULL,
    spiller_id INTEGER NOT NULL,
    CONSTRAINT oppstilling_spiller
        FOREIGN KEY (oppstilling_id)
        REFERENCES kamp_oppstillinger(id)
        ON DELETE CASCADE,
    CONSTRAINT spiller_oppstilling
        FOREIGN KEY (spiller_id)
        REFERENCES spillere(id)
        ON DELETE CASCADE,
    CONSTRAINT unique_spiller_per_oppstilling
        UNIQUE (oppstilling_id, spiller_id)
);
CREATE TABLE IF NOT EXISTS omganger(
    id SERIAL PRIMARY KEY,
    omgang_nr INTEGER UNIQUE NOT NULL,
    tid TIMESTAMP NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS kamper(
    id SERIAL PRIMARY KEY,
    tid TIMESTAMP NOT NULL UNIQUE,
    omgang_id INTEGER,
    lag_1_id INTEGER NOT NULL,
    lag_2_id INTEGER NOT NULL,
    CONSTRAINT ulike_lag CHECK (lag_1_id <> lag_2_id),
    CONSTRAINT kamp_omgang
        FOREIGN KEY (omgang_id)
        REFERENCES omganger(id)
        ON DELETE CASCADE,
    CONSTRAINT kamp_lag_1
        FOREIGN KEY (lag_1_id)
        REFERENCES kamp_oppstillinger(id)
        ON DELETE CASCADE,
    CONSTRAINT kamp_lag_2
        FOREIGN KEY (lag_2_id)
        REFERENCES kamp_oppstillinger(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS maal(
    id SERIAL PRIMARY KEY,
    video TEXT,
    kamp_id INTEGER,
    spiller_id INTEGER,
    CONSTRAINT maal_kamp
        FOREIGN KEY (kamp_id)
        REFERENCES kamper(id),
    CONSTRAINT maal_spiller
        FOREIGN KEY (spiller_id)
        REFERENCES spillere(id)
);