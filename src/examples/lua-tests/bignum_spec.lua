local mtev = mtev

describe("bignum creation", function()

  it("can compare", function()
    local ints =        { 10, 100, 1, -20, -2, 78, 11, 11, 0, 0 }
    local sorted_ints = { -20, -2, 0, 0, 1, 10, 11, 11, 78, 100 }
    local bns = {}
    local sorted_bns = {}
    for _,n in ipairs(ints) do table.insert(bns, mtev.bignum_new(n)) end
    for _,n in ipairs(sorted_ints) do table.insert(sorted_bns, mtev.bignum_new(n)) end
    table.sort(bns)
    assert.are.same(bns, sorted_bns)
  end)

  it("make new -5", function()
    local a = mtev.bignum_new(-5)
    assert.are.equals(a:todec(), "-5")
  end)

  it("make new 0 from dec", function()
    local a = mtev.bignum_dec2bn("0")
    assert.are.equals(a:todec(), "0")
  end)
  it("make new 1 from dec", function()
    a = mtev.bignum_dec2bn("1")
    assert.are.equals(a:todec(), "1")
  end)
  it("make new big number from dec", function()
    a = mtev.bignum_dec2bn("123456789123456789123456789123456789123456789")
    assert.are.equals(a:todec(), "123456789123456789123456789123456789123456789")
  end)

  it("make new 0 from hex", function()
    local a = mtev.bignum_hex2bn("0")
    assert.are.equals(a:tohex(), "0")
  end)
  it("make new big number from hex", function()
    a = mtev.bignum_hex2bn("123456789123456789123456789123456789123456789")
    assert.are_not.equals(a:todec(), "123456789123456789123456789123456789123456789")
    assert.are.equals(a:tohex(), "0123456789123456789123456789123456789123456789")
  end)

  local v24 = mtev.bignum_new(24);

  it("can add", function()
    local a = mtev.bignum_new(11)
    local b = mtev.bignum_new(13)
    local r = mtev.bignum_new()
    r:add(a,b)
    assert.is.equals(r,v24)
    assert.is.equals(a+b,r)
  end)

  it("can sub", function()
    local a = mtev.bignum_new(37)
    local b = mtev.bignum_new(13)
    local r = mtev.bignum_new()
    r:sub(a,b)
    assert.is.equals(r,v24)
    assert.is.equals(a-b,r)
  end)

  local pow_answer = mtev.bignum_dec2bn(
"87713190320051356083991233214679562583334878212154477541978690300254" ..
"83962097202810559508036287394227230326492052002927454330758259548735" ..
"78067797945585343461578718281062985172496670952261948908853589263958" ..
"63822167052043622354845393808490665694792464570296671849231584831150" ..
"29186772528124541037147193532708500346143772699324201771703019379211" ..
"37281000621647439606570640430395014568353846142286559141589567213759" ..
"90172592553474820389238763419664101413891569825480037134891055882470" ..
"89944556563053801676205277674197486968212891291871442402838606469145" ..
"66109336178699959222635912890257679345023533944224627750756324528972" ..
"31930040929302254692436420489119475399296826518436739219949008356997" ..
"52502186050669988940017050334297112435146043875251164463913900770986" ..
"57332794153820950453684803311922922573234110303861204378708292418716" ..
"07407019443061507459775402817435544190342915836940611934013952240425" ..
"02378273032178627154273004139230704400141353863948819996400845785731" ..
"30519006735355489097377597268030055516704024978311010655821006575302" ..
"85217400018078267876396359118422275270386356455946738272918247547646" ..
"85621723057473468965286731721790532024515296754824441018977109160273" ..
"10936870548166366021376128131510286673986115816523937768584351255134" ..
"39696923619800008122295692449145361814397157315946926766170039667890" ..
"80119967385509398781642371045111792803458698469510296672927436476301" ..
"10763518087240950196323793063874762538436177364697191460724543271937" ..
"16930928277094840094364365087654962330373248846871952724392643964738" ..
"41130667750017718208975146621827015140171757666458199118439002916132" ..
"28998008067083179950860496301214149834957067502869743680651555805780" ..
"93540057771762673561155265323140809610745905213677774001658354981143" ..
"0953114927104")

  it("can pow", function()
    local a = mtev.bignum_new(234);
    local b = mtev.bignum_new(723);
    local r = mtev.bignum_new();
    r:exp(a,b)
    assert.is.equals(r,pow_answer)
    assert.is.equals(a^b,r)
  end)
end)
