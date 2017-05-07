-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local widget = require("widget")

--CONFIGURAÇÕES GERAIS
display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)
display.setDefault("background", 0,0,0)

--
altBtn = display.contentHeight / 6
tamBtn = display.contentWidth / 5.11
--
posBotoesX   = display.contentCenterX + 97
posBotoesY   = display.contentCenterY
--
posBotoesOpX = display.contentCenterX - 159
posBotoesOpY = display.contentCenterY

--
apaga     = false
reiniciar = false
ponto     = true
iniciar   = true
operador  = ""
vlr1      = 0
vlr2      = 0 

--====CONSTRUÇÃO DA TELA===----
dspTela = display.newGroup()

--
displayStr = display.newText({text="", width = display.contentWidth, height = display.contentHeight, fontSize = 60, align="right"})
displayStr:setFillColor(1,1,1, 0.6)
displayStr.x = -70
displayStr.y = 300

--
bcgtela = display.newRect(1, 200, display.contentWidth - 65,160) 
bcgtela:setFillColor(1,1,1, 0.5)
bcgtela.anchorX = 0
bcgtela.anchorY = 0

--inserindo obj no grupo
dspTela:insert(bcgtela)
dspTela:insert(displayStr)

--===BOTOES===----
function botoes()
    --
    btn9 = widget.newButton({label="9", x = posBotoesX - 192, y = posBotoesY - 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btn8 = widget.newButton({label="8", x = posBotoesX - 128, y = posBotoesY - 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btn7 = widget.newButton({label="7", x = posBotoesX - 64, y = posBotoesY - 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
     
    --abaixo todos ficarão na lateral direita
     btn6 = widget.newButton({label="6", x = posBotoesX, y = posBotoesY - 283, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btn5 = widget.newButton({label="5", x = posBotoesX, y = posBotoesY - 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btn4 = widget.newButton({label="4",x = posBotoesX, y = posBotoesY - 121, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
   
     -- 
     btn3 = widget.newButton({label="3", x = posBotoesX, y = posBotoesY -40, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btn2 = widget.newButton({label="2", x = posBotoesX, y = posBotoesY + 41, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })

    --
    btn1 = widget.newButton({label="1",x = posBotoesX, y = posBotoesY + 121.5, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    
    --
    btnZro = widget.newButton({label="0", x = posBotoesX, y = posBotoesY + 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
end


function botoesOperacao()
    --operadores
    --2 linha
    
    --
    clr = widget.newButton({label="clr", x = posBotoesOpX, y = 119, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --
    btnMais = widget.newButton({label="+", x = posBotoesOpX, y = -43, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    -- 3 linha
    btnMenos = widget.newButton({label="-", x = posBotoesOpX, y = 38, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --4 linha
    btnMult = widget.newButton({label="x", x = posBotoesOpX, y = 442, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    --5 linha
    btnDiv = widget.newButton({label="/", x = posBotoesOpX, y = 361.5, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
    
    btnVirgula = widget.newButton({label=",", x = posBotoesX - 128, y = -43, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })

    btnEqls = widget.newButton({label="=", x = posBotoesX - 128, y = posBotoesY + 202, width=tamBtn, height=altBtn, shape="Rect", 
        fillColor={default={1,1,1,0.3}, over={0,1,0}},
        labelColor={default={1,0,0}, over={0,1,0}}
        })
end

--==Funções para calcular valores==---
--
function soma(n1, n2)
    local resultSoma = n1 + n2
    return resultSoma
end

--
function subtrai(n1, n2)
    local resultSub = n1 - n2
    return resultSub
end

--
function mult(n1,n2)
    local resultMult = n1 * n2
    return resultMult
end

--
function div(n1, n2)
    if n2 == "0" then
        local alert = "Erro: Divisão por zero"
        return alert
    else
        local resultDiv = n1 / n2
        return resultDiv
    end
end

function aEvents(event)
    if event.phase == "began" then
        --
        if reiniciar == true then
            displayStr.text = "" --dspTela:setLabel("T")
            reiniciar = false
        end
    
        --
        if displayStr.text == "Erro: Divisão por zero" then
            displayStr.text = ""
        end

        --
        if displayStr.text == "" then
            iniciar = false
        end

        --
        if event.target:getLabel() == "clr" then
            displayStr.text = ""
            print("no limpar com o clear ", displayStr.text)
            ponto = true

        else if event.target:getLabel() == "+" then
            vlr1 = displayStr.text
            print("valor para vlr1 ",vlr1)
            operador = "+"
            displayStr.text = ""
            ponto = true

        elseif event.target:getLabel() == "-" then
            vlr1 = displayStr.text
            operador = "-"
            displayStr.text = ""
            ponto = true

        elseif event.target:getLabel() == "x" then
            vlr1 = displayStr.text
            operador = "*"
            displayStr.text = ""
            ponto = true

        elseif event.target:getLabel() == "/" then
            vlr1 = displayStr.text
            operador = "/"
            displayStr.text = ""
            ponto = true

        elseif event.target:getLabel() == "=" then
            if displayStr.text ~= "" and vlr1 ~= "" and displayStr.text ~= "Erro: Divisão por zero" then --if 1
                print("dentro do eqls ", displayStr.text)
                print("dentro do eqls vlr1", vlr1)
                apaga = true
                ponto = true

                if operador == "+" then
                    vlr2 = displayStr.text
                    displayStr.text = soma(vlr1,vlr2)
                    --print("depois do iguar ", displayStr.text)
                --um end para esse if
                elseif operador == "-" then
                    vlr2 = displayStr.text
                    displayStr.text = subtrai(vlr1,vlr2)
                    --print("depois do iguar ", displayStr.text)

                elseif operador == "*" then
                    vlr2 = displayStr.text
                    displayStr.text = mult(vlr1,vlr2)
                   -- print("depois do iguar ", displayStr.text)
                elseif operador == "/" then
                    vlr2 = displayStr.text
                    displayStr.text = div(vlr1,vlr2)
                    --print("depois do iguar ", displayStr.text)
                end
                
            end --fecha c o if 1
        
            else
            if apaga == true then
            --print (vlr1)
            displayStr.text = ""
            displayStr.text = displayStr.text .. event.target:getLabel()
            print("primeira rotina ", displayStr.text)
            apaga = false
            --end
            else

            displayStr.text = displayStr.text .. event.target:getLabel()
            print("segunda rotina ", displayStr.text)
            end
        end
        end
        end
        end
        --end
        --end
--end
-- end
--end
--end

--chamada para inicio de funções
botoes()
botoesOperacao()

--chamada para eventos dos botoes // poderia ser como propriedade do botão usando onEvent
btnZro:addEventListener("touch", aEvents)
btn1:addEventListener("touch", aEvents)
btn2:addEventListener("touch", aEvents)
btn3:addEventListener("touch", aEvents)
btn4:addEventListener("touch", aEvents)
btn5:addEventListener("touch", aEvents)
btn6:addEventListener("touch", aEvents)
btn7:addEventListener("touch", aEvents)
btn8:addEventListener("touch", aEvents)
btn9:addEventListener("touch", aEvents)
btnVirgula:addEventListener("touch", aEvents)

--chamada para botao limpar dspTela / displayStr
clr:addEventListener("touch", aEvents)

--botoes operadores
btnMais:addEventListener("touch", aEvents)
btnMenos:addEventListener("touch", aEvents)
btnMult:addEventListener("touch", aEvents)
btnDiv:addEventListener("touch", aEvents)

--operador de igualdade
btnEqls:addEventListener("touch", aEvents)


