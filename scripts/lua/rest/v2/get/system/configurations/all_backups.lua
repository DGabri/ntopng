--
-- (C) 2013-23 - ntop.org
--

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path
package.path = dirs.installdir .. "/scripts/lua/modules/system_config/?.lua;" .. package.path

-- ##############################################

local backup_config = require("backup_config")
local rest_utils = require("rest_utils")

-- ##############################################

local rc = rest_utils.consts.success.ok

local epoch_list = backup_config.list_backup()

if epoch_list then
  rest_utils.answer(rc, epoch_list)
end

-- ##############################################
