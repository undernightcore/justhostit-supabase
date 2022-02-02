-- This script was generated by the Schema Diff utility in pgAdmin 4
-- For the circular dependencies, the order in which Schema Diff writes the objects is not very sophisticated
-- and may require manual changes to the script to ensure changes are applied in the correct order.
-- Please report an issue for any failure with the reproduction steps.

ALTER TABLE IF EXISTS public."Plantillas"
    RENAME id TO nombre;

ALTER TABLE public."Plantillas"
    ALTER COLUMN nombre TYPE text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Plantillas"
    ALTER COLUMN nombre DROP IDENTITY;

ALTER TABLE IF EXISTS public."Plantillas"
    ALTER COLUMN nombre SET STORAGE EXTENDED;

ALTER TABLE IF EXISTS public."Plantillas"
    ADD COLUMN descripcion text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Plantillas"
    ADD COLUMN logo text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Instancias"
    RENAME id TO nombre;

ALTER TABLE public."Instancias"
    ALTER COLUMN nombre TYPE text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Instancias"
    ALTER COLUMN nombre DROP IDENTITY;

ALTER TABLE IF EXISTS public."Instancias"
    ALTER COLUMN nombre SET STORAGE EXTENDED;

ALTER TABLE IF EXISTS public."Instancias"
    ADD COLUMN descripcion text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Instancias"
    ADD COLUMN dominio text COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public."Instancias"
    ADD COLUMN "puertoSsh" smallint;

CREATE POLICY "Permitir inserción de instancias nuevas"
    ON public."Instancias"
    AS PERMISSIVE
    FOR INSERT
    TO public
    WITH CHECK ((auth.uid() = id_user));


CREATE POLICY "Permitir actualización de nombre y descripción"
    ON public."Instancias"
    AS PERMISSIVE
    FOR UPDATE
    TO public
    USING ((auth.uid() = id_user))
    WITH CHECK (((nombre = nombre) AND (descripcion = descripcion)));


DROP POLICY IF EXISTS "Prohibir inserción de instancias nuevas" ON public."Instancias";
