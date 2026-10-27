-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.Buffer.Dedicated
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.Buffer
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local buffer_create = buffer.create;
local buffer_copy = buffer.copy;
local buffer_writei8 = buffer.writei8;
local buffer_writei16 = buffer.writei16;
local buffer_writei32 = buffer.writei32;
local buffer_writeu8 = buffer.writeu8;
local buffer_writeu16 = buffer.writeu16;
local buffer_writeu32 = buffer.writeu32;
local buffer_writef32 = buffer.writef32;
local buffer_writef64 = buffer.writef64;
local buffer_writestring = buffer.writestring;

function u1.copy(p2: any, p3: number, p4: buffer?, p5: buffer?, p6: number?, p7: number?) -- Line: 26
    -- upvalues: buffer_copy (copy), buffer_create (copy)
    if p4 then
        buffer_copy(p4, p3, p5 or p2.buffer, p6, p7);

        return;
    end;

    buffer_copy(buffer_create(p7 or 128), p3, p5 or p2.buffer, p6, p7);
end;

function u1.alloc(p8: any, p9: number) -- Line: 34
    -- upvalues: buffer_create (copy), buffer_copy (copy)
    local size = p8.size;
    local buffer2 = p8.buffer;

    while size <= p8.point + p9 do
        size = math.floor(size * 1.5);
    end;

    buffer_copy(buffer_create(size), 0, buffer2);
    p8.point = p8.next;
    p8.next = p8.next + p9;
end;

function u1.build(p10) -- Line: 52
    -- upvalues: buffer_create (copy), buffer_copy (copy)
    local v11 = p10.next > p10.point and p10.next or p10.point;
    local v12 = buffer_create(v11);
    buffer_copy(v12, 0, p10.buffer, 0, v11);

    return v12;
end;

function u1.wi8(p13: any, p14: number) -- Line: 60
    -- upvalues: buffer_writei8 (copy)
    if not p14 then
        return;
    end;

    p13:alloc(1);
    buffer_writei8(p13.buffer, p13.point, p14);
end;

function u1.wi16(p15: any, p16: number) -- Line: 66
    -- upvalues: buffer_writei16 (copy)
    if not p16 then
        return;
    end;

    p15:alloc(2);
    buffer_writei16(p15.buffer, p15.point, p16);
end;

function u1.wi32(p17: any, p18: number) -- Line: 72
    -- upvalues: buffer_writei32 (copy)
    if not p18 then
        return;
    end;

    p17:alloc(4);
    buffer_writei32(p17.buffer, p17.point, p18);
end;

function u1.wu8(p19: any, p20: number) -- Line: 78
    -- upvalues: buffer_writeu8 (copy)
    if not p20 then
        return;
    end;

    p19:alloc(1);
    buffer_writeu8(p19.buffer, p19.point, p20);
end;

function u1.wu16(p21: any, p22: number) -- Line: 84
    -- upvalues: buffer_writeu16 (copy)
    if not p22 then
        return;
    end;

    p21:alloc(2);
    buffer_writeu16(p21.buffer, p21.point, p22);
end;

function u1.wu32(p23: any, p24: number) -- Line: 90
    -- upvalues: buffer_writeu32 (copy)
    if not p24 then
        return;
    end;

    p23:alloc(4);
    buffer_writeu32(p23.buffer, p23.point, p24);
end;

function u1.wf32(p25: any, p26: number) -- Line: 96
    -- upvalues: buffer_writef32 (copy)
    if not p26 then
        return;
    end;

    p25:alloc(4);
    buffer_writef32(p25.buffer, p25.point, p26);
end;

function u1.wf64(p27: any, p28: number) -- Line: 102
    -- upvalues: buffer_writef64 (copy)
    if not p28 then
        return;
    end;

    p27:alloc(8);
    buffer_writef64(p27.buffer, p27.point, p28);
end;

function u1.wstring(p29: any, p30: string) -- Line: 108
    -- upvalues: buffer_writestring (copy)
    if not p30 then
        return;
    end;

    p29:alloc(#p30);
    buffer_writestring(p29.buffer, p29.point, p30);
end;

function u1.flush(p31) -- Line: 114
    -- upvalues: buffer_create (copy)
    p31.point = 0;
    p31.next = 0;
    p31.size = 128;
    p31.buffer = buffer_create(128);
end;

function u1.new() -- Line: 121
    -- upvalues: buffer_create (copy), u1 (copy)
    local v32 = {
        point = 0,
        next = 0,
        size = 128,
        buffer = buffer_create(128)
    };

    return setmetatable(v32, u1);
end;

function u1.remove(p33) -- Line: 130
    table.clear(p33);
    setmetatable(p33, nil);
end;

return u1.new;