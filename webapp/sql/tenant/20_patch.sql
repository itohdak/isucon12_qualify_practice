CREATE INDEX idx_tenant_id_competition_id_player_id_row_num ON player_score (tenant_id, competition_id, player_id, row_num);
CREATE INDEX idx_tenant_id_competition_id_row_num ON player_score (tenant_id, competition_id, row_num);
CREATE INDEX idx_created_at_id_tenant_id ON competition (created_at, id, tenant_id);

CREATE TABLE player_score_tmp AS SELECT * FROM player_score p1 WHERE NOT EXISTS (SELECT 1 FROM player_score p2 WHERE p1.player_id == p2.player_id AND p1.competition_id == p2.competition_id AND p1.tenant_id == p2.tenant_id AND p1.row_num < p2.row_num);
DROP TABLE player_score;
alter table player_score_tmp rename to player_score;
CREATE INDEX idx_tenant_id_competition_id_player_id_row_num ON player_score (tenant_id, competition_id, player_id, row_num);
CREATE INDEX idx_tenant_id_competition_id_row_num ON player_score (tenant_id, competition_id, row_num);

CREATE TABLE billing_report (
  tenant_id BIGINT NOT NULL,
  competition_id VARCHAR(255) NOT NULL,
  player_count BIGINT NOT NULL,
  visitor_count BIGINT NOT NULL,
  billing_player_yen BIGINT NOT NULL,
  billing_visitor_yen BIGINT NOT NULL,
  billing_yen BIGINT NOT NULL,
  PRIMARY KEY (tenant_id, competition_id)
);