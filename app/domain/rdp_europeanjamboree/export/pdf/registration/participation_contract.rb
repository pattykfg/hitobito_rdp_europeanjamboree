# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
    module Export::Pdf::Registration
        class ParticipationContract < Section
    
            def render
                pdf.y = bounds.height - 60
                bounding_box([0, 230.mm], width: bounds.width, height: bounds.height - 200) do
                    font_size(10) do
                        text list, style: :italic, width: bounds.width
                    end
                end
            end

            def list 
                pdf.start_new_page
                of_legal_age = @person.years.to_i >= 18

                text "Teilnahmevertrag", :size => 16
    
                text "Hiermit " + (of_legal_age ? "melde ich mich " : "melden wir unsere Tochter*unseren Sohn ") + @person.full_name + ", geboren am " + @person.birthday.strftime("%d.%m.%Y") + " verbindlich als " + @person.role + " zum European Jamboree 2020 an. Mit " + (of_legal_age ? "meiner Unterschrift bestätige ich" : "unserer Unterschrift bestätigen wir") + " die Kenntnis- und Annahme der Teilnahmebedingungen des Veranstalters, rdp e.V., zum European Jamboree 2020."
                pdf.move_down 3.mm
                if not of_legal_age
                    text "Für die Dauer der Reise übertragen wir die Ausübung der Aufsichtspflicht bzw. des Aufenthaltsbestimmungsrechtes über unser Kind dem Reiseveranstalter. Wir sind damit einverstanden, dass die Ausübung im erforderlichen Ausmaß auf volljährige Betreuer*innen übertragen wird."
                    pdf.move_down 3.mm
                end 

                if @person.role == "International Service Team (IST)" #Settings.person.type.ist #TODO Settings key value
                    text "Mir ist bekannt, dass ich mich zusätzlich zu dieser Anmeldung selbstständig auf einer mit noch bekannt zu gebenden Internetseite anmelden muss."
                    pdf.move_down 3.mm
                end 
                pdf.stroke_horizontal_rule
                pdf.move_down 2.mm
                text (of_legal_age ? "Ich erkäre mich" : "Wir erklären uns") + " damit einverstanden, dass Fotos und/oder Videomaterialien veröffentlicht und gespeichert werden, die in der Vorbereitung und Durchführung der Teilnahme des deutschen Kontingentes am European Jamboree 2020 entstehen und auf denen " + (of_legal_age ? "ich zu sehen bin." : "unsere Tochter*unser Sohn zu sehen ist.") + " Dies umfasst die Vorbereitungstreffen, das Vorlager, die Vor-/Nachtouren sowie das European Jamboree selbst. " + (of_legal_age ? "Ich stimme" : "Wir stimmen") + " des Weiteren zu, dass sämtliche Rechte für die Nutzung und Veröffentlichung dieser Aufnahmen folgendem Rechtsträger zustehen: Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V. (rdp e.V.). Innerhalb des deutschen Kontingentes zum European Jamboree 2020 ist die Verantwortliche Simone Voit  (kontingentsleitung@europeanjamboree.de). Der rdp e.V. und das deutsche Kontingent zum European Jamboree 2020 als Teil dessen sowie Dritte, die in deren Einverständnis handeln (die Mitgliedsverbände), dürfen die Bilder und/oder Videomaterialien ohne jede zeitliche, örtliche und inhaltliche Einschränkung in unveränderter Form, ungeachtet der Übertragungs-, Träger- und Speichertechniken (insbesondere elektronische Technologien) auf angebrachte Weise analog und digital veröffentlichen. Dies schließt die Nutzung für zukünftige Werbezwecke ein. Die Bilder können mit anderem Bildmaterial, Grafik oder Text kombiniert, abgeändert, skaliert oder beschnitten werden (z.B. für die Erstellung von Collagen oder dem Einfügen eines Logos). Es werden keine Bilder verbunden mit personenbezogenen Daten veröffentlicht. Davon unberührt bleibt ein explizites Einverständnis. " + (of_legal_age ? "Ich weiß, dass ich" : "Wir wissen, dass wir") + " jederzeit und ohne Angabe von Gründen die Einwilligung mit Wirkung für die Zukunft widerrufen " + (of_legal_age ? "kann" : "können") + " (auch für einzelne Veranstaltungen)."
                pdf.move_down 1.mm
                text "Die Streichung dieser Teilerklärung ist möglich.", :size => 8
                pdf.stroke_horizontal_rule
                pdf.move_down 3.mm
                text "Im Weiteren ist " + (of_legal_age ? "mir" : "uns") + " bekannt, dass eine Teilnahme " + (of_legal_age ? "meine" : "unseres Kindes an unsere") + " Zustimmung zur Datenschutzerklärung i.S.d. DSGVO zur Speicherung notwendiger persönlicher Daten gebunden ist. Entsprechende Erklärung ist beigefügt und unterschrieben."
                pdf.move_down 3.mm
                if of_legal_age
                    pdf.make_table([
                        [{:content => @person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                                ["______________________________", ""],
                            [{:content => @person.full_name, :height => 30}, ""]],
                            :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw
                else
                    pdf.make_table([
                        [{:content => @person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                                ["______________________________", "______________________________"],
                        [{:content => "Erziehungsberechtigte*er", :height => 30}, "Erziehungsberechtigte*r"],
                        ["______________________________", ""],
                        [{:content => @person.full_name, :height => 30}, ""]],
                            :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw 
                end
                text ""
            end 
        end
    end
end  