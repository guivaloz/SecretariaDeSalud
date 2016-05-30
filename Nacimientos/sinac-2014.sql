--
-- Secretaría de Salud / Salud en Números / Datos Abiertos - Nacimientos 2014
--

CREATE TABLE sinac_2014 (

    entidad_nacmad      character varying, -- Entidad de Nacimiento de la Madre
    municipio_nacmad    character varying, -- Municipio de Nacimiento de la Madre
    fech_nacm           date,              -- Fecha de Nacimiento de la Madre
    estado_civil        character varying, -- Estado conyugal de la Madre
    entidad_resmad      character varying, -- Entidad de residencia de la Madre
    mpo_resmad          character varying, -- Municipio de residencia de la Madre
    loc_resmad          character varying, -- Localidad de residencia de la Madre
    numero_embarazos    integer,           -- Número de embarazos de la Madre
    nacidos_muertos     integer,           -- Número de hijos nacidos muertos de la Madre
    nacidos_vivos       integer,           -- Número de hijos nacidos vivos de la Madre
    sobrevivientes      integer,           -- Número de hijos sobrevivientes de la Madre
    anterior_nacio      character varying, -- Condición de nacimiento del hijo inmediato anterior
    vive_aun            character varying, -- Vive aún el hijo (a) inmediato anterior
    orden_nac           integer,           -- Orden de nacimiento del nacido vivo
    atencion_prena      character varying, -- La Madre recibió atención prenatal
    trimestr_aten       character varying, -- Trimestre en el que la Madre recibió la primer consulta prenatal
    consultas           integer,           -- Total de consultas otorgadas durante el embarazo
    sobrevivio_parto    character varying, -- La Madre sobrevivió al parto
    derechohabiencia    character varying, -- Derechohabiencia 1 de la Madre
    derechohabiencia2   character varying, -- Derechohabiencia 2 de la Madre
    escolaridad         character varying, -- Escolaridad de la Madre
    desc_ocuphab        character varying, -- Ocupación de la Madre
    ocupacion_habitual  character varying, -- Código de la ocupación de la Madre
    trabaja_actualmente character varying, -- Trabaja actualmente

    fech_nach           date,              -- Fecha de nacimiento del nacido vivo
    hora_nach           character varying, -- Hora de nacimiento del nacido vivo
    sexo_rn             character varying, -- Sexo del nacido vivo
    gestach             integer,           -- Semanas de gestación
    tallah              integer,           -- Talla de nacido vivo
    pesoh               integer,           -- Peso del nacido vivo
    apgarh              integer,           -- Calificación obtenida del nacido vivo a los cinco minutos del nacimiento
    silverman           integer,           -- Calificación obtenida del nacido vivo a los cinco minutos del nacimiento
    nacimientos         integer,
    mes_naci            character varying,

    bcg                 character varying, -- Se le aplicó la vacuna BCG al nacido vivo
    hepatitis_b         character varying, -- Se le aplicó la vacuna Hepatitis B al nacido vivo
    vitamina_a          character varying, -- Se le aplicó la vitamina A al nacido vivo
    vitamina_k          character varying, -- Se le aplicó la vitamina K al nacido vivo
    tamiz_auditivo      character varying, -- Se le realizó el tamiz auditivo al nacido vivo
    producto            character varying, -- Producto de un embarazo único o múltiple
    cie10               character varying,
    cie10_2da           character varying,
    procedimiento       character varying, -- Procedimiento utilizado en el nacimiento
    forceps             character varying, -- Procedimiento utilizado en el nacimiento
    otro_procedimiento  character varying, -- Descripción del procedimiento utilizado

    lugar_nacim         character varying, -- Lugar de nacimiento del recién nacido
    clues               character varying, -- Catálogo Único de Establecimientos en Salud (CLUES) asignada a la unidad médica del sitio de atención del parto
    unidad_clues        character varying,
    atendio_parto       character varying, -- Persona que atendió el parto
    otro_atendio_parto  character varying, -- Especifica que otra persona atendió el parto
    certificado_por     character varying, -- Persona que certificó el nacimiento

    entidad_nacim       character varying, -- Entidad donde ocurrio el nacimiento
    mpo_nacim           character varying, -- Municipio donde ocurrio el nacimiento
    loc_nacim           character varying, -- Localidad donde ocurrio el nacimiento
    jurisd_nacim        character varying,

    entidad_certif      character varying, -- Entidad del certificante
    mpo_certif          character varying, -- Municipio del certificante
    localidad_certif    character varying, -- Localidad del certificante
    fech_certif         date               -- Fecha de la certificación

);
