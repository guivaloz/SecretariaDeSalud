--
-- Secretaría de Salud - Recursos Salud 2014 por Municipio
--

CREATE TABLE recursos_salud_2014_municipios (

    entidad                           character(2)         NOT NULL,
    clave                             character(5)         PRIMARY KEY,
    nombre                            character varying    NOT NULL,

    poblacion_total                   integer,
    poblacion_total_masculina         integer,
    poblacion_total_femenina          integer,

    camas_hospitalizacion_total       integer,  -- total de camas  en área de hospitalización (censables)
    camas_no_hospitalizacion_total    integer,  -- total de camas  en áreas diferentes  a hospitalización "no censables"
    camas_urgencias                   integer,  -- número de camas en área de urgencias
    camas_cirugia_ambulatoria         integer,  -- número de camas en área de cirugía ambulatoria y/o corta estancia
    camas_trabajo_parto               integer,  -- número de camas para área de trabajo de parto
    camas_recuperacion_postparto      integer,  -- número de camas en área de recuperación postparto
    camas_terapia_intensiva           integer,  -- número de camas en área de terapia intensiva
    camas_terapia_intermedia          integer,  -- número de camas en área de terapia intermedia
    camas_otras_areas                 integer   -- número de camas en otras áreas (no considerando área de hospitalización)

);

SELECT AddGeometryColumn('recursos_salud_2014_municipios', 'geom', 97999, 'MULTIPOLYGON', 2);
