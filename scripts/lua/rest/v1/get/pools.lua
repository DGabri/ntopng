--
-- (C) 2013-24 - ntop.org
--

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path
package.path = dirs.installdir .. "/scripts/lua/modules/pools/?.lua;" .. package.path

local pools_rest_utils = require "pools_rest_utils"

pools_rest_utils.get_all_instances_pools()
