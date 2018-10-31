HIGH_RATE_VALUE = 1.1
LOW_RATE_VALUE = 0.9
DEFAULT_RATE_VALUE = 1
RATE_VALUES = {'high' => HIGH_RATE_VALUE, 'low' => LOW_RATE_VALUE}
REFERENCES = { 15 =>  0.75, 25 => 0.775, 50 => 0.8, 75 => 0.825, 100 => 0.85, 200 => 0.875, 400 => 0.9, 600 => 0.925}

def get_price_suggestion
  (price_reference - product_database.shipping_cost * shipping_cost_factor ) * rate_factor
end

private

def shipping_cost_factor
  reference_number = REFERENCES.keys.find {|ref| price_reference < ref}
  factor = REFERENCES[reference_number]
  return factor || 0.95
end

def rate_factor
  RATE_VALUES[brand.rating] || DEFAULT_RATE_VALUE
end

price_suggestion = get_price_suggestion
price_original = price_suggestion
