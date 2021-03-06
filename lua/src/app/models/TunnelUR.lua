
local TunnelBase = import(".TunnelBase")

local TunnelUR = class("TunnelUR", TunnelBase)

function TunnelUR:ctor()
    TunnelUR.super.ctor(self)
    self.link_ = {
        TunnelBase.PU,
        TunnelBase.PR
    }
    self.type_ = TunnelBase.TUNNEL_UR
    self.typeInactive_ = TunnelBase.TUNNEL_UR .. "-gray"
end


return TunnelUR

