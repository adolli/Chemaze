
local TunnelBase = import("..models.TunnelBase")
local TunnelUD = import("..models.TunnelUD")
local TunnelLR = import("..models.TunnelLR")
local TunnelUL = import("..models.TunnelUL")
local TunnelUR = import("..models.TunnelUR")
local TunnelLD = import("..models.TunnelLD")
local TunnelRD = import("..models.TunnelRD")
local GT = import("..models.GenericTunnel")

local TB = TunnelBase

local Levels = class("Levels")

Levels.recentPlay = 1

Levels.level = {
    {
        name = "Beginning",
        origin = {
            {1, 2, 3},
            {0, 4, 5},
            {7, 8, 6}
        },
        target = {
            {1, 2, 3},
            {4, 5, 0},
            {7, 8, 6}
        },
        tunnelSeq = {
            { {TunnelBase}, {TunnelUD}, {TunnelBase} },
            { {TunnelBase}, {TunnelBase}, {TunnelUD} },
            { {TunnelBase}, {TunnelUD}, {TunnelBase} }
        },
        tsrc = {
            r = -1, -- the row and column of source and sink index from 0 
            c = 1,
            dir = { dr = 1, dc = 0 },
            edge = TunnelBase.PD,
            edgename = "D",
            status = TunnelBase.ACTIVATED
        },
        tsnk = {
            r = 3,
            c = 1,
            dir = { dr = -1, dc = 0 },
            edge = TunnelBase.PU,
            edgename = "U",
            status = TunnelBase.DEACTIVATED -- caution: volatile field, init to DEACTIVATED by hand
        }
    },
    {
        name = "Stairs",
        origin = {
            {5, 1, 3},
            {0, 7, 2},
            {8, 4, 6}
        },
        target = {
            {1, 0, 3},
            {5, 7, 6},
            {8, 2, 4}
        },
        tunnelSeq = {
            { {TunnelRD}, {TunnelBase}, {TunnelRD} },
            { {TunnelBase}, {TunnelLR}, {TunnelBase} },
            { {TunnelUL}, {TunnelBase}, {TunnelUL} }
        },
        tsrc = {
            r = 2,
            c = -1,
            dir = { dr = 0, dc = 1 },
            edge = TunnelBase.PR,
            edgename = "R",
            status = TunnelBase.ACTIVATED
        },
        tsnk = {
            r = 0,
            c = 3,
            dir = { dr = 0, dc = -1 },
            edge = TunnelBase.PL,
            edgename = "L",
            status = TunnelBase.DEACTIVATED
        }
    },
    {
        name = "Mirror",
        origin = {
            {1, 3, 7},
            {8, 0, 2},
            {4, 6, 5}
        },
        target = {
            {1, 2, 3},
            {4, 5, 0},
            {7, 8, 6}
        },
        tunnelSeq = {
            { {TunnelBase}, {TunnelLR}, {TunnelUR} },
            { {TunnelLD}, {TunnelBase}, {TunnelRD} },
            { {TunnelRD}, {TunnelBase}, {TunnelUL} }
        },
        tsrc = {
            r = 0,
            c = 3,
            dir = { dr = 0, dc = -1 },
            edge = TunnelBase.PL,
            edgename = "L",
            status = TunnelBase.ACTIVATED
        },
        tsnk = {
            r = 3,
            c = 1,
            dir = { dr = -1, dc = 0 },
            edge = TunnelBase.PU,
            edgename = "U",
            status = TunnelBase.DEACTIVATED
        }
    },
    {
        name = "Heart",
        origin = {
            {3, 5, 0},
            {6, 8, 7},
            {4, 2, 1}
        },
        target = {
            {0, 1, 2},
            {3, 4, 5},
            {6, 7, 8}
        },
        tunnelSeq = {
            { 
                {GT:create({link={TB.PR, TB.PD}, type_="RDr"})}, 
                {TunnelUD}, 
                {TB} 
            },
            { 
                {GT:create({link={TB.PU, TB.PR}, type_="URr"})}, 
                {TunnelUD, GT:create({link={TB.PL, TB.PR}, type_="LRcross"})}, 
                {TunnelLR} 
            },
            { 
                {TunnelUL}, 
                {GT:create({link={TB.PL, TB.PD}, type_="LDr"})}, 
                {GT:create({link={TB.PR, TB.PD}, type_="RDr"})} 
            }
        },
        tsrc = {
            r = 3,
            c = 2,
            dir = { dr = -1, dc = 0 },
            edge = TunnelBase.PU,
            edgename = "U",
            status = TunnelBase.ACTIVATED
        },
        tsnk = {
            r = 2,
            c = 3,
            dir = { dr = 0, dc = -1 },
            edge = TunnelBase.PL,
            edgename = "L",
            status = TunnelBase.DEACTIVATED
        }
    },
    {
        name = "Tasty",
        origin = {
            {2, 7, 1},
            {6, 4, 8},
            {3, 0, 5}
        },
        target = {
            {1, 0, 2},
            {3, 4, 5},
            {6, 7, 8}
        },
        tunnelSeq = {
            { 
                {TB}, 
                {GT:create({link={TB.PL, TB.PR, TB.PD}, type_="LRDflame", typeInactive_="fragment-maple"})}, 
                {TB} 
            },
            { 
                {GT:create({link={TB.PU, TB.PR}, type_="URr"})}, 
                {GT:create({link={TB.PL, TB.PR}, type_="LRhotgas"})}, 
                {GT:create({link={TB.PU, TB.PL}, type_="ULr"})} 
            },
            { 
                {GT:create({link={TB.PL, TB.PR, TB.PD}, type_="LRD"})}, 
                {TB}, 
                {GT:create({link={TB.PL, TB.PR, TB.PD}, type_="LRD"})} 
            }
        },
        tsrc = {
            r = 3,
            c = 1,
            dir = { dr = -1, dc = 0 },
            edge = TunnelBase.PU,
            edgename = "U",
            status = TunnelBase.ACTIVATED
        },
        tsnk = {
            r = 1,
            c = 3,
            dir = { dr = 0, dc = -1 },
            edge = TunnelBase.PL,
            edgename = "L",
            status = TunnelBase.DEACTIVATED
        }
    }
}

return Levels

