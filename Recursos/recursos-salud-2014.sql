--
-- Secretaría de Salud / Salud en Números / Datos Abiertos - Recursos Salud 2014
--

CREATE TABLE recursos_salud_2014 (

    latitud                           numeric(6,4),      -- Latitude
    longitud                          numeric(6,4),      -- Longitude
    nombre                            character varying, -- name
    descripcion                       character varying, -- description
    icono                             integer,           -- icon
    clues                             character varying, -- clues
    institucion_nombre                character varying, -- nombre de la institucion de salud
    institucion_clave                 character varying, -- clave de la institucion de salud
    entidad_nombre                    character varying, -- nombre de la entidad
    entidad                           character(2),      -- clave entidad
    municipio_nombre                  character varying, -- nombre del municipio
    municipio                         character(3),      -- clave municipio
    localidad_nombre                  character varying, -- nombre de la localidad
    localidad                         character(4),      -- clave localidad
    tipo_establecimiento_nombre       character varying, -- nombre del tipo de establecimiento
    tipo_establecimiento              character varying, -- clave de tipo de establecimiento
    tipologia                         character varying, -- nombre de la tipologia
    unidad                            character varying, -- nombre de la unidad
    domicilio_calle                   character varying, -- calle
    domicilio_numero_exterior         character varying, -- numero exterior
    domicilio_numero_interior         character varying, -- numero interior
    domicilio_colonia                 character varying, -- colonia
    domicilio_asentamiento            character varying, -- asentamiento
    domicilio_observaciones           character varying, -- observaciones de la direccion
    domicilio_cp                      character varying, -- codigo postal
    unidad_estatus                    character varying, -- estatus de la unidad
    unidad_responsable                character varying, -- responsable de la unidad
    contacto_lada                     character varying, -- lada
    contacto_telefono                 character varying, -- telefono
    contacto_email                    character varying, -- correo electronico
    consultorios_total                integer,           -- total de consultorios
    consultorios_medicina_general     integer,           -- número de consultorios medicina general
    consultorios_medicina_familiar    integer,           -- número de consultorios medicina familiar *
    consultorios_odontologia          integer,           -- número de consultorios odontología
    consultorios_psicologia           integer,           -- número de consultorios psicología y/o salud mental
    consultorios_psiquiatria          integer,           -- número de consultorios psiquiatría
    consultorios_otras_especialidades integer,           -- número de consultorios de otras especialidades
    camas_hospitalizacion_total       integer,           -- total de camas en área de hospitalización (censables)
    camas_no_hospitalizacion_total    integer,           -- total de camas  en áreas diferentes  a hospitalización "no censables"
    camas_urgencias                   integer,           -- número de camas  en área de urgencias
    camas_cirugia_ambulatoria         integer,           -- número de camas  en área de cirugía ambulatoria y/o corta estancia
    camas_trabajo_parto               integer,           -- número de camas  para área de trabajo de parto
    camas_recuperacion_postparto      integer,           -- número de camas  en área de recuperación postparto
    camas_terapia_intensiva           integer,           -- número de camas  en área de terapia intensiva
    camas_terapia_intermedia          integer,           -- número de camas  en área de terapia intermedia
    camas_otras_areas                 integer,           -- número de camas  en otras áreas (no considerando área de hospitalización)
    cunas_recien_nacido               integer,           -- número de cunas recién nacido
    quirofanos                        integer,           -- número de quirófanos
    salas_expulsion                   integer,           -- número de salas expulsión
    equipos_rayos_x                   integer,           -- número de equipo de rayos x (sin considerar rayos x dental) tanto fijos como móviles
    equipos_rayos_x_dental            integer,           -- número de rayos x dental
    equipos_pacs                      integer,           -- número de sistemas de archivo y comunicación de imágenes (pacs)
    equipos_pet                       integer,           -- número de sistemas de medicina nuclear por emisión de potrones (pet)
    equipos_aceleradores_lineales     integer,           -- número de aceleradores lineales
    equipos_angiografos               integer,           -- número de angiógrafos
    equipos_arcos_c                   integer,           -- número de arcos en c
    equipos_camaras_hiperbaricas      integer,           -- número de cámaras hiperbáricas
    equipos_colposcopios              integer,           -- número de colposcopios
    equipos_cunas_calor_radiante      integer,           -- número de cunas de calor radiante
    equipos_incubadoras               integer,           -- número de incubadoras
    equipos_ecocardiografos           integer,           -- número de ecocardiógrafos
    equipos_electrocardiografos       integer,           -- número de electrocardiógrafos
    equipos_electroencefalografos     integer,           -- número de electroencefalógrafos
    equipos_endoscopios               integer,           -- número de endoscopios
    equipos_esterotaxias_mamografia   integer,           -- número de equipos de esterotaxia para mamografia
    equipos_mastografos               integer,           -- número de mastógrafos
    equipos_ultrasonidos              integer,           -- número de equipos de ultrasonido
    equipos_radioterapias             integer,           -- número de equipos en unidades de radioterapia
    equipos_resonancia_magnetica      integer,           -- número de equipos resonancia magnética
    equipos_unidades_medicina_nuclear integer,           -- número de gamma cámaras/unidad medicina nuclear
    equipos_litotriptores             integer,           -- número de litotriptores
    equipos_hemodialisis              integer,           -- número de máquinas (equipos) para hemodiálisis
    equipos_tomografos                integer,           -- número de tomógrafos
    equipos_ventiladores              integer,           -- número de ventiladores
    equipos_bombas_cobalto            integer,           -- bomba de cobalto **
    ambulancias                       integer,           -- total de ambulancias
    medicos_contacto_paciente         integer,           -- médicos en contacto con el paciente
    medicos_generales                 integer,           -- número de médicos generales
    medicos_familiares                integer,           -- número de médicos familiares
    medicos_pediatras                 integer,           -- número de médicos pediatras
    medicos_ginecoobstetras           integer,           -- número de médicos ginecoobstetras
    medicos_cirujanos                 integer,           -- número de médicos cirujanos (general y especializado)
    medicos_internistas               integer,           -- número de médicos internistas
    odontologos                       integer,           -- número de odontólogos (incluye cirujanos maxilofacial)
    medicos_especialistas             integer,           -- otros médicos especialistas
    pasantes_medicina                 integer,           -- número de pasantes de medicina
    pasantes_odontologia              integer,           -- número de pasantes de odontología
    internos_pregrado                 integer,           -- número de internos de pregrado
    redidentes                        integer,           -- número de residentes
    medicos_otras_labores             integer,           -- total de médicos en otras labores
    enfermeras_contacto_paciente      integer,           -- total de enfermeras en contacto con el paciente
    enfermeras_generales              integer,           -- número de enfermeras generales
    enfermeras_especialistas          integer,           -- número de enfermeras especialistas
    enfermeras_pasantes               integer,           -- número de enfermeras pasantes
    enfermeras_auxiliares             integer,           -- número de enfermeras auxiliares
    enfermeras_otras_labores          integer,           -- total de enfermeras en otras labores
    personal_profesional_total        integer,           -- total de otro personal profesional
    personal_tecnico_total            integer,           -- total de personal técnico
    personal_otro_total               integer            -- total de otro personal

);
