DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;


/* CREATE TABLE visit_history_tmp AS (
    SELECT
        *
    FROM
        visit_history v1
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                visit_history v2
            WHERE
                v1.player_id = v2.player_id
                AND v1.tenant_id = v2.tenant_id
                AND v1.competition_id = v2.competition_id
                AND v1.created_at > v2.created_at
        )
);
CREATE INDEX idx_tenant_id_competition_id_player_id_created_at ON visit_history_tmp (tenant_id, competition_id, player_id, created_at);
DROP TABLE visit_history;
ALTER TABLE visit_history RENAME visit_history; */