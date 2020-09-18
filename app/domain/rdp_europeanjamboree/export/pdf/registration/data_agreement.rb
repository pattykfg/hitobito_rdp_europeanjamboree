# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
    module Export::Pdf::Registration
        class DataAgreement < Section
    
            def render
                pdf.y = bounds.height - 60
                bounding_box([0, 230.mm], width: bounds.width, height: bounds.height - 200) do
                    font_size(8) do
                        text list, style: :italic, width: bounds.width
                    end
                end
            end

            def list 
                of_legal_age = @person.years.to_i >= 18

                text "Datenschutzerklärung", :size => 14
                if of_legal_age
                    text "Unser Umgang mit deinen Daten und deine RechteInformationen nach Art. 13, 14 und 21 der EU-Datenschutz-Grundverordnung (DSGVO)"	
                else 
                    text "Unser Umgang mit den Daten Ihrer*s Tochter*Sohn und Ihre RechteInformationen nach Art. 13, 14 und 21 der EU-Datenschutz-Grundverordnung (DSGVO)"
                end

                pdf.move_down 3.mm
                text "Ausführung für die eigenen Unterlagen" , :size => 12

                text "Mit den folgenden Informationen möchten wir " + (of_legal_age ? "dir" : "ihnen") + " einen Überblick über die Verarbeitung " + (of_legal_age ? "deiner" : "Ihrer") + " personenbezogenen Daten durch uns und " + (of_legal_age ? "deine" : "Ihre") + " daraus entstehenden Rechte geben. Welche Daten im Einzelnen verarbeitet und in welcher Weise genutzt werden, richtet sich maßgeblich nach den jeweils beantragten bzw. vereinbarten Dienstleistungen. Daher werden ggf. nicht alle hier enthaltenen Aussagen auf " + (of_legal_age ? "dich" : "Sie") + " zutreffen." 
                pdf.move_down 3.mm
                text "1. Wer ist für die Datenverarbeitung verantwortlich und an wen kann ich mich wenden?", :size => 10
                pdf.move_down 3.mm
                text "Verantwortliche Stelle ist:"
                text "Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V."
                text "Chausseestr. 128/129"
                text "10115 Berlin"	
                text "Dadurch beauftragt:	Deutsches Kontingent zum European Jamboree 2020	Vertreten durch Günther Bäte (Head of Contingent)"
                pdf.move_down 3.mm
                text "In der Bearbeitung der eingegangenen Unterlagen:"
                text "Bund der Pfadfinderinnen und Pfadfinder e.V. (BdP)" 
                text "Kesselhaken 23"
                text "34376 Immenhausen"
                pdf.move_down 3.mm
                text "Wir verarbeiten " + (of_legal_age ? "deine" : "Ihre") + "  Daten zur Erfüllung der vertraglichen Anforderungen teilweise gemeinsam; die Verantwortlichkeit für die Verarbeitung triff damit alle genannten Stellen (Art. 26 DSGVO)." 
                pdf.move_down 3.mm
                text "2. Art der erhobenen personenbezogenen Daten", :size => 12 
                pdf.move_down 3.mm
                text "Wir verarbeiten die personenbezogenen Daten, die wir im Rahmen " + (of_legal_age ? "deiner" : "Ihrer") + "  Anmeldung und Teilnahme  " + (of_legal_age ? "" : "Ihrer*s Tochter*Sohnes") + "  am deutschen Kontingent zum European Jamboree 2020 erhalten." 	
                pdf.move_down 3.mm
                text "Diese personenbezogenen Daten sind:"
                text "-	Name und Anschrift"
                text "-	Telefonnummern und E-Mail-Adressen"
                text "-	Verbandszugehörigkeiten"
                text "-	Geburtsdatum"
                text "-	Bankverbindung"
                text "-	erteilte Lastschrift-Mandate"
                text "-	Gesundheitsdaten wie auf dem Gesundheitsbogen angegeben (z.B. Impfstatus, Vorerkrankungen und regelmäßig einzunehmende Medikamente/Notfallmedikamente), werden im späteren Verlauf durch die Unitleitungen erfragt"
                text "-	Einsichtnahme Führungszeugnis"
                text "-	IST Jobauswahl"
                text "-	Kluft/Blusen Größe"
                text "-	Lebensmittelunverträglichkeiten"
                pdf.move_down 3.mm
                text "Rechtsgrundlage ist Art. 6 Abs. 1 S. 1 lit. b und lit. f DSGVO."
                pdf.move_down 3.mm
                text "Wir verarbeiten " + (of_legal_age ? "deine" : "Ihre") + "  Daten zum Zwecke der Anmeldung beim deutschen Kontingent sowie zur Übermittlung der Daten an die Organisatoren des deutschen Kontingentes und damit zur Erfüllung von vertraglichen Pflichten die Teilnahme zu ermöglichen (Art. 6 Abs. 1 Buchst. b DSGVO). Wir verarbeiten personenbezogene Daten im Einklang mit den Bestimmungen der europäischen Datenschutz-Grundverordnung (DSGVO) und dem Bundesdatenschutzgesetz (BDSG). "
                text "Bei rechtlich anzugehenden Vorfällen (Täuschung, Betrug etc.) kann die Offenlegung personenbezogener Daten im Rahmen von behördlichen/gerichtlichen Maßnahmen zu Zwecken der Beweiserhebung, Strafverfolgung oder Durchsetzung zivilrechtlicher Ansprüche erforderlich werden."
                text "Im Rahmen der Interessenabwägung (Art. 6 Abs. 1 f DSGVO) verarbeiten wir " + (of_legal_age ? "deine" : "Ihre") + "  Daten über die eigentliche Erfüllung des Vertrages hinaus zur Wahrung lebenswichtiger Interessen."
                pdf.move_down 3.mm
                text "3.	Wer bekommt meine Daten?", :size => 12
                text "-	Kontingentsteammitglieder und Unitleitungen für den Kontakt mit " + (of_legal_age ? "dir" : "Ihnen") + "  und die vertragliche Zusammenarbeit (inkl. der Erfüllung vorvertraglicher Maßnahmen) (nach Prinzip der Datensparsamkeit, beispielsweise Adressen ohne namentlichen Bezug zur Anreiseplanung)"
                text "-	Mitarbeiter*innen des BdP, Kesselhaken 23,  34376 Immenhausen zur Bearbeitung der eingegangenen Unterlagen"
                text "-	Weitere Beauftragte des rdp e.V. sofern zur Erfüllung der vertraglichen Verpflichtungen erforderlich"
                pdf.move_down 3.mm
                text "Sämtliche Personen sind vertraglich gebunden und insbesondere schriftlich dazu verpflichtet, " + (of_legal_age ? "deine" : "Ihre") + "  Daten vertraulich zu behandeln." 
                text "Eine Weitergabe von Daten an Empfänger*innen außerhalb unseres Kontingentes und des rdp e.V. erfolgt nur unter Beachtung der anzuwendenden Vorschriften zum Datenschutz."
                pdf.move_down 3.mm
                text "Empfänger personenbezogener Daten sind die Organisatoren des European Jamborees 2020. ISTs geben ihre Daten selbstständig an diese weiter durch die Anmeldung bei den Organisatoren. 	" + (of_legal_age ? "Deine" : "Ihre") + "  Daten werden nur innerhalb der Europäischen Union und Staaten innerhalb des Europäischen Wirtschaftsraums (EWR) verarbeitet."
                pdf.move_down 3.mm
                text "4.	Wie lange werden meine Daten gespeichert?", :size => 12
                text"Wir verarbeiten und speichern " + (of_legal_age ? "deine" : "Ihre") + "  personenbezogenen Daten, solange dies für die Erfüllung unserer vertraglichen und gesetzlichen Pflichten erforderlich ist. Sind die Daten für die Erfüllung vertraglicher oder gesetzlicher Pflichten nicht mehr erforderlich, werden diese regelmäßig gelöscht (Gem. Art. 17 Abs. 1 lit. a DSGVO)." 
                text "Ausnahmen ergeben sich,"
                text "-	soweit gesetzliche Aufbewahrungspflichten zu erfüllen sind, z.B. Handelsgesetzbuch (HGB) und Abgabenordnung (AO), erforderlich sind. Die dort vorgegebenen Fristen zur Aufbewahrung bzw. Dokumentation betragen in der Regel sechs bis zehn Jahre;"
                text "-	zur Erhaltung von Beweismitteln im Rahmen der gesetzlichen Verjährungsvorschriften."
                pdf.move_down 3.mm
                text "Nach den §§ 195 ff des Bürgerlichen Gesetzbuches (BGB) können diese Verjährungsfristen bis zu 30 Jahre betragen, wobei die regelmäßige Verjährungsfrist 3 Jahre beträgt."
                text "Sofern die Datenverarbeitung im berechtigten Interesse von uns oder einem Dritten erfolgt, werden die personenbezogenen Daten gelöscht, sobald dieses Interesse nicht mehr besteht. Hierbei gelten die genannten Ausnahmen."
                text "5.	Welche Datenschutzrechte habe ich?", :size => 12
                text "Du " + (of_legal_age ? "du hast" : "sie haben") + "  das Recht auf Auskunft nach Artikel 15 DSGVO, das Recht auf Berichtigung nach Artikel 16 DSGVO, das Recht auf Löschung nach Artikel 17 DSGVO, das Recht auf Einschränkung der Verarbeitung nach Artikel 18 DSGVO, das Recht auf Widerspruch aus Artikel 21 DSGVO sowie das Recht auf Datenübertragbarkeit aus Artikel 20 DSGVO. Beim Auskunftsrecht und beim Löschungsrecht gelten ggf. Einschränkungen nach §§ 34 und 35 BDSG. Darüber hinaus besteht ein Beschwerderecht bei einer zuständigen Datenschutzaufsichtsbehörde (Artikel 77 DSGVO i.V.m. § 19 BDSG)." 
                pdf.move_down 3.mm
                text "6.	Gibt es eine Pflicht zur Bereitstellung von Daten?", :size => 12
                text "Im Rahmen des Vertragsverhältnisses musst " + (of_legal_age ? "musst du" : "müssen Sie") + "  diejenigen personenbezogenen Daten bereitstellen, die für die Aufnahme, Durchführung und Beendigung des Vertragsverhältnisses und zur Erfüllung der damit verbundenen vertraglichen Pflichten erforderlich sind oder zu deren Erhebung wir gesetzlich verpflichtet sind. Ohne diese Daten werden wir in der Regel nicht in der Lage sein, den Vertrag mit Dir zu schließen oder diesen auszuführen."
                pdf.move_down 3.mm
                text "Information über Ihr Widerspruchsrecht nach Artikel 21 Datenschutz-Grundverordnung (DSGVO)", :size => 12
                text "Einzelfallbezogenes Widerspruchsrecht", :size => 10
                text (of_legal_age ? "Du hast" : "Sie haben") + "  das Recht, aus Gründen, die sich aus  " + (of_legal_age ? "deiner" : "Ihrer") + "   besonderen Situation ergeben, jederzeit gegen die Verarbeitung Sie betreffender personenbezogener Daten, die aufgrund von Artikel 6 Absatz 1 Buchstabe f DSGVO (Datenverarbeitung auf der Grundlage einer Interessenabwägung)  " + (of_legal_age ? "erfolgt" : "erfolgen") + "  , Widerspruch einzulegen; dies gilt auch für ein auf diese Bestimmung gestütztes Profiling im Sinne von Artikel 4 Nr. 4 DSGVO." 
                text (of_legal_age ? "Legst du" : "Legen Sie") + "  Widerspruch ein, werden wir " + (of_legal_age ? "deine" : "Ihre") + "  personenbezogenen Daten nicht mehr verarbeiten, es sei denn, wir können zwingende schutzwürdige Gründe für die Verarbeitung nachweisen, die  " + (of_legal_age ? "gegen deine" : "gegen Ihre") + "   Interessen, Rechte und Freiheiten überwiegen, oder die Verarbeitung dient der Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen."
                text "Der Widerspruch kann formfrei mit dem Betreff „Widerspruch“ unter Angabe Ihres Namens, Ihrer Adresse und Ihres Geburtsdatums erfolgen und sollte gerichtet werden an die Kontingentsleitung, namentlich Günther Bäte (kontingentsleitung@europeanjamboree.de)."
                pdf.move_down 3.mm
                text "Diese Vorlage wurde mit dem kostenlosen Kunden-Informationsschreiben-Generator der activeMind AG erstellt (Version: 2018-07-31)"
                
                pdf.start_new_page
                text "Zustimmung zur Datenschutzerklärung zur Teilnahme am deutschen Kontingent zum European Jamboree 2020", :size => 12
                pdf.move_down 3.mm
                if of_legal_age
                    text "Hiermit stimme ich, " + @person.full_name + ", zu, dass meine Daten wie in der Datenschutzerklärung erklärt verarbeitet werden dürfen." 
                    pdf.move_down 3.mm
                    text "Die Datenschutzerklärung liegt mir vor."
                    pdf.move_down 3.mm
                    text "Ich habe verstanden, dass ich jederzeit Widerspruch einlegen kann. Mir ist klar, dass nur erforderliche Daten erhoben werden und daher bei Widerspruch die Einhaltung des Vertrages (die Teilnahme am European Jamboree im deutschen Kontingent) nicht möglich ist."
                    pdf.move_down 5.mm
                    text ""
                    pdf.make_table([
                        [{:content => @person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                                ["______________________________", ""],
                            [{:content => @person.full_name, :height => 30}, ""]],
                            :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw
                else
                    text "Hiermit stimme*n ich*wir zu, dass die Daten meines*r/unserer*s Tochter*Sohn, " + @person.full_name + ", wie in der Datenschutzerklärung erklärt verarbeitet werden dürfen." 
                    text "Die Datenschutzerklärung liegt mir*uns vor."
                    text "Ich*Wir habe*n verstanden, dass ich jederzeit Widerspruch einlegen kann*können. Mir*Uns ist klar, dass nur erforderliche Daten erhoben werden und daher bei Widerspruch die Einhaltung des Vertrages (die Teilnahme am European Jamboree im deutschen Kontingent) nicht möglich ist."
                    pdf.move_down 5.mm
                    text ""
                    pdf.make_table([
                        [{:content => @person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                                ["______________________________", "______________________________"],
                        [{:content => "Erziehungsberechtigte*r", :height => 30}, "Erziehungsberechtigte*r"],
                        ["______________________________", ""],
                        [{:content => @person.full_name, :height => 30}, ""]],
                            :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw 
                end
                text ""
            end 
        end
    end
end  