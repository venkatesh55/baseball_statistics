class Player < ApplicationRecord
  has_many :teams, through: :league_paticipations

  before_save :calculate_avg, :if => :any_avg_fields_changed?
  before_save :calculate_ops, :if => :any_ops_fields_changed?
  before_save :calculate_sb

  AVG_FIELDS = %w[hits at_bats]
  OPS_FIELDS = %w[hits walks hit_by_pitch at_bats sacrifice_flies]

  def calculate_avg
    return unless at_bats != 0
    self.avg = hits.to_f / at_bats
  end

  def calculate_ops
    self.ops = (on_base_percentage + slugging_percentage).round(2) unless on_base_percentage.nan? || slugging_percentage.nan?
  end

  def on_base_percentage
    (hits + walks + hit_by_pitch).to_f / (at_bats + walks + hit_by_pitch + sacrifice_flies)
  end

  def slugging_percentage
    ((hits) + (2*doubles) + (3*triples) + (4*home_runs)).to_f / (at_bats)
  end

  def calculate_sb
  end

  def any_avg_fields_changed?
    self.new_record? || AVG_FIELDS.any?{|field| self.send("#{field}_changed?")}
  end

  def any_ops_fields_changed?
    self.new_record? || OPS_FIELDS.any?{|field| self.send("#{field}_changed?")}
  end

end