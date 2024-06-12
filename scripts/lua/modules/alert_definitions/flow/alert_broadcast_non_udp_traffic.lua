--
-- (C) 2019-24 - ntop.org
--

-- ##############################################


local flow_alert_keys = require "flow_alert_keys"

-- Import the classes library.
local classes = require "classes"
-- Make sure to import the Superclass!
local alert = require "alert"
-- Import Mitre Att&ck utils
local mitre = require "mitre_utils"

-- ##############################################

local alert_broadcast_non_udp_traffic = classes.class(alert)

-- ##############################################

alert_broadcast_non_udp_traffic.meta = {
   alert_key = flow_alert_keys.flow_alert_broadcast_non_udp_traffic,
   i18n_title = "flow_checks_config.broadcast_non_udp_traffic_title",
   icon = "fas fa-fw fa-exclamation",

   has_attacker = true,

   -- Mitre Att&ck Matrix values
   mitre_values = {
      mitre_tactic = mitre.tactic.discovery,
      mitre_tecnique = mitre.tecnique.network_service_discovery,
      mitre_id = "T1046"
   },

   -- Default values
   default = {
      -- Fitlters to be applied on the alert, e.g., cli_port=23
      filters = {},
   }
}

-- ##############################################

function alert_broadcast_non_udp_traffic:init(cli_mac)
   -- Call the parent constructor
   self.super:init()

   self.alert_type_params = {
      cli_mac = cli_mac
   }
end

-- #######################################################

function alert_broadcast_non_udp_traffic.format(ifid, alert, alert_type_params)
   local data = {
      ip = alert.cli_ip or "~",
      mac = "~"
   }

   if alert_type_params.cli_mac then
      data["mac"] = alert_type_params["cli_mac"]
   end

   return i18n("flow_details.broadcast_non_udp_traffic", data)
end

-- #######################################################

return alert_broadcast_non_udp_traffic
