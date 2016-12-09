# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Note: Seed file should ideally be idempotent.

[
  {name: 'N2', description: "Manufacturing-grade (metallic) Naquadah. Key element in Goa'uld technology from hand devices to ship hulls. This lot was reforged from salvaged armor plates from the <i>Dread Crocodile</i>.", quantity: 2140, unit: 'kg'},
  {name: 'N3', description: "Enriched and refined 'weapons-grade' Naquadah. Extremely high energy density, used to power nearly all Goa'uld technology, and as fuel in the Mk1 Naquadah Generator. As the enrichment process not yet well understood, the SGC stockpile of N3 is exclusively the product of raids on Goa'uld worlds, though the ARES mining operation is expected to being producing more within 6-8 weeks. Each generator consumes up to ~100g per week, depending on load and configuration.", quantity: 19.4, unit: 'kg'},
  {name: 'Trinium', description: 'Superlatively strong and lightweight metal. Essential component in Tollan phase-shifting technology. A considerable quantity is in storage at the SGC, a gift from the Omeyocan following the Battle of Haquvits Temple.', quantity: 200, unit: 'kg'},
  {name: 'Naquadah Generators', description: "The Naquadah Generator was developed by Maj. Carter's team at the SGC, based on an example unit provided by the Orbanians. It consumes small quantities of enriched naquadah (N3) to produce comparatively vast quanities of clean, safe electrical power. This, combined with its portable design and ease of operation, makes it ideal for off-world missions. These units are part of the Mk1 production run, manufactured by a joint US-Russian effort headed by Dr. Rodney McKay. <span class='good'>3</span> are currently active in Omega Base.", quantity: 2, unit: ''},
].each do |attrs|
  r = Resource.find_or_create_by_name(attrs[:name])
  r.update(attrs)
end

# name: text, proposer: text, description: text, resources: text, status: string 
[
  {name: "Establish base camp", 
    proposer: "Lt. Col. S. Carlsson", 
    description: "We put a generator in the tree room and piled up supplies. It’s fine. I don’t understand why I have to enter this into some system. It’s already done.", 
    resources: '1 Naquadah Generator', 
    status: 'complete', 
    approved_at: 4.weeks.ago},
  {name: "Power up the bridge", 
    proposer: "MSgt. D. Maguire", 
    description: "Fun fact: This field has a minimum length of 50...", 
    resources: '1 Naquadah Generator', 
    status: 'complete', 
    approved_at: 4.weeks.ago},
  {name: "Manufacturing Workshop", 
    proposer: "SSgt. D. Strider", 
    description: "Airman Tre’bek’s recon parties have located what we think was a primary engineering facility in the stern sector. This facility could be set it up as a base of operations for the repair teams. While studies of the existing machinery in this area are incomplete, the space itself is suitable for setting up our own gear: milling machines, forges, smelters, presses, etc. This project would require a generator to run the machines.",
    resources: "1 Naquadah Generator", 
    status: 'complete', 
    approved_at: 2.weeks.ago},
  {name: "Intraship Tram - Main Line Activation", 
    proposer: "Dr. F. Michaels", 
    description: "<i>Apeiron</i> is immense - imagine a skyscraper that covers six hundred city blocks. Keeping our teams supplied is starting to strain on our logistical abilities. It looks like the Ancients used a network of super-fast ‘train cars’ (for lack of a better term), to move quickly between different areas of the ship. I’m not sure why - they certainly had the technology to teleport via transport rings. Anyway, given the number of personnel we’re bringing it, I recommend we attempt to bring at least the central pathway of this network back online. We can use the generator already installed in the Arboretum for power, but there are a some cracks in the rails that should be repaired. They appear to be constructed of a naquadah-iron-titanium alloy that Sgt. Strider assures me we can replicate without difficulty.", 
    resources: '~160kg of N2', 
    status: 'complete', 
    approved_at: 1.week.ago },
  {name: "Deep Memory Sampling", proposer: 'Lt. G. Satterfield', 
    description: "<i>Apeiron</i> is as much an archive as a ship - every bulkhead and deck plate contains a crystal lattice capable of storing vast amounts of information. This ‘Deep Memory’ storage could contain incredibly valuable information from the Ancients. I’ve developed a portable device that should allow our researchers to temporarily power up a local section of Deep Memory and, hopefully, extract some of that information. The device is powered by a liquid Naquadah fuel cell, similar to that used in the Ma’tok staff weapon. Without the primary AI available, we have no way of knowing what’s stored where, but any information stored by the Ancients must be worth having.", 
    resources: '250g N3. Timeframe: 1 week for initial tests.', 
    status: 'approved', 
    approved_at: DateTime.now},
  {name: "Power Core Chamber Repair", proposer: 'SSgt. D. Strider', 
    description: 'Per MSgt. Maguire’s instruction, we have completed a preliminary analysis of the <i>Apeiron</i> power core (the hologram calls it a <i>potentia nexus</i>). Full report is on file. There’s nothing to be done about the crystals themselves, but we can begin repairs on the chamber containing them - replacing the ‘stalks’ that would hold the four missing crystals, and repairing the heavy armor of the chamber itself. This should result in a marginal increase in power generated by the core. These repairs will also prevent us all from dying of exposure to exotic particle radiation and/or superhot plasma, if and when the core is restored to full power.', 
    resources: '500-600kg of N2, ~100kg of Trinium. Timeframe: 3-4 weeks', 
    status: 'approved', approved_at: DateTime.now},
].each do |attrs|
  r = Project.find_or_create_by_name(attrs[:name])
  r.update(attrs)
end


[
  {name: "Anubis & Underlings", fleet: '900', territory: '35*',
    notes: "The largest single force of of Anubis forces is commanded by his lieutenant, Zipacna. OSI notes high uncertainty in these estimates due to the difficulty of maintaining agents among the forces of Anubis."},
  {name: "Yu and Allies", fleet: '725', territory: '63',
    notes: "Includes the forces of Yu, Amaterasu, and Bastet. It is believed that the primary strategic commander is Yu's First Prime, Oshu. High confidence in territorial claims due to ongoing diplomatic relations."},
  {name: "Ba'al", fleet: '470', territory: '28',
    notes: "Ba'al commands the largest force not currently committed to the ongoing conflict. So far, Ba'al appears to be hanging back and avoiding conflict. His motives, as always, are unclear."},
  {name: "Kali", fleet: '85', territory: '3',
    notes: "OSI predicts that Kali will shortly follow the example of Bastet and ally with Lord Yu."},
  {name: "Olokun/Svarog", fleet: '0', territory: '0*',
    notes: "Both of the Goa'uld have been effectively wiped out by Anubis. They are personally unaccounted for, and may be dead or in the service of Anubis. In any case, neither retains any significant military strength or territory."},
  {name: "Morrigan", fleet: '65', territory: '4',
    notes: ""},
  {name: "'Free' Jaffa", fleet: '3', territory: '1*',
    notes: "The Jaffa rebellion is small and has limited organization. They do, however, have a handful of captured death gliders and single partially-demilitarized <i>Al'kesh</i>. They currently share space at the SGC Alpha Site."},
  {name: "Earth/SGC", fleet: '2', territory: '3*',
    notes: "Salvaged gliders from various sources, including the <i>Dread Crocodile</i>. Includes the first squad of <i>Project Antaeus</i> prototypes, projected to be in service in ~6 weeks. <i>Project Prometheus</i> (being on indefinite hold), and Omega Base resources (inoperative and inestimable) are not included. System count excludes bases not reported to Yu’s Alliance."},
].each do |attrs|
  r = Faction.find_or_create_by_name(attrs[:name])
  r.update(attrs)
end
