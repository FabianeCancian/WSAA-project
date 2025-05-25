-- Create a new database named 'news'
CREATE DATABASE news;

-- Create a table called 'sources' to store news source information
CREATE TABLE sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Create a table called 'articles' to store individual news articles
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_id INT,
    author VARCHAR(255),
    title TEXT,
    description TEXT,
    url TEXT,
    urlToImage TEXT,
    publishedAt DATETIME,
    content LONGTEXT,
    FOREIGN KEY (source_id) REFERENCES sources(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Prepopulate the source table with some news API values
INSERT INTO sources (name) VALUES
('Politico'),
('Wired'),
('The Washington Post'),
('Vox'),
('BBC News'),
('Page Six'),
('CNBC'),
('Gematsu'),
('NPR'),
('ZDNet'),
('New York Post'),
('NBC News'),
('CBS Sports'),
('The Action Network');

-- Prepopulate the articles table with some news API values
INSERT INTO articles (source_id,author,title,description,url,urlToImage,publishedAt,content) VALUES
(
  1,
 'Elena Schneider',
 'Dems roll out ads hitting Republicans on Medicaid - Politico',
 'Democratic groups are preparing to start running ads next week attacking House Republicans for their vote to cut Medicaid spending.',
 'https://www.politico.com/news/2025/05/23/democrats-ads-medicaid-spending-00367272',
 'https://static.politico.com/33/ab/80e552fd4b6d92eccad2a651edee/u-s-congress-32350.jpg',
 '2025-05-23 17:30:00',
 'The core argument in the midterms and the TLDR on this budget is its the largest cut to Medicaid in history, said Jesse Ferguson, a Democratic strategist. As people find that out, they know its not a… [+3129 chars]'
),
(
  2,
 'Joel Khalili',
 'A Helicopter, Halibut, and ‘Y.M.C.A’: Inside Donald Trump’s Memecoin Dinner - WIRED',
 'On Thursday evening, US president Donald Trump attended a private banquet with 200 of the largest investors in his personal crypto coin. Here\'s what happened.',
 'https://www.wired.com/story/a-helicopter-halibut-and-ymca-inside-donald-trumps-memecoin-dinner/',
 'https://media.wired.com/photos/682ceff4684cd01a32075fc3/191:100/w_1280,c_limit/Trump-Crypto-Dinner-Business.jpg',
 '2025-05-23 17:11:07',
 'As US president Donald Trump left the stage at his golf club near Washington, DC, on Thursday night, he pointed to the crowd, brought his index finger to his templeas if to say: You know whats coming… [+2831 chars]'
),
(
  9,
 'Unknown',
 'The White House rejects a watchdog finding that it\'s breaking the law over halted funds - NPR',
 'The White House budget office rejected the conclusion of a nonpartisan congressional watchdog that said the Trump administration is breaking the law by not spending funds as directed by Congress.',
 'https://www.npr.org/2025/05/23/nx-s1-5409080/trump-white-house-impoundment-gao',
 'https://npr.brightspotcdn.com/dims3/default/strip/false/crop/2000x1125+0+0/resize/1400/quality/100/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F07%2F07%2Fb3d935444b87a0a03122530ac87a%2Fap24214674180614.jpg',
 '2025-05-23 17:04:52',
 'The White House budget office on Friday rejected the conclusion of a nonpartisan congressional watchdog that said the Trump administration is breaking the law by not spending funds as directed by Con… [+2674 chars]'
),
(
  3,
 'Evan Halper, Maxine Joselow',
 'Clean energy dollars are gushing to red states. Now GOP senators are in a bind. - The Washington Post',
 'Hundreds of billions of dollars in spending on red-state projects are jeopardized by Trump’s sweeping tax bill, which will face intense lobbying in the Senate.',
 'https://www.washingtonpost.com/business/2025/05/23/senate-clean-energy-tax-credits/',
 'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/6V2ULYOFLPVKGV6GJYPEIW5OGU.JPG&w=1440',
 '2025-05-23 17:00:22',
 'Donald Trump campaigned last year on reversing what he called the Green New Scam, but Republican senators now must grapplewith the reality behind the slogan: cutting hundreds of billions of dollars o… [+7757 chars]'
),
(
  4,
 'Ian Millhiser',
 'The Supreme Court just revealed one thing it actually fears about Trump - vox.com',
 'The Republican justices draw a line in the sand – in an order that makes absolutely no sense.',
 'https://www.vox.com/scotus/414274/supreme-court-federal-reserve-trump-wilcox',
 'https://platform.vox.com/wp-content/uploads/sites/2/2025/05/gettyimages-2203339296.jpg?quality=90&strip=all&crop=0%2C10.755320479603%2C100%2C78.489359040795&w=1200',
 '2025-05-23 16:45:00',
 'On Thursday evening, the Supreme Court handed down a brief order, which temporarily permits President Donald Trump to fire two federal officials who, by law, are shielded from being summarily termina… [+10838 chars]'
),
(
  5,
 'https://www.facebook.com/bbcnews',
 'UN says Gaza in \'cruellest phase\' of war as 9,000 trucks\' worth of aid ready at border - BBC',
 'After Israel eased its 11-week aid block this week, UN Secretary-General Antonio Guterres says Gaza\'s entire population is at risk of famine.',
 'https://www.bbc.com/news/live/c8repn0dv4xt',
 'https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/e5dc/live/8b847920-37d2-11f0-96c3-cf669419a2b0.jpg',
 '2025-05-23 16:41:55',
 'Alice CuddyReporting from Jerusalem\r\n\'Oh my God, oh my God, oh my God,\' a panicked voice repeats before a loud explosion can be heard. \r\nThen the voice note ends. \r\nKhamis Elessi, a doctor in Gaza Ci… [+1346 chars]'
),
(
  6,
 'Leah Bitsky',
 'Barry Keoghan admits he’s an ‘addict’: ‘I’ve got scars here to literally prove it’ - Page Six',
 '“I’m accepting. I’m present. I’m content. I’m a father. I’m getting to just see that haze that was once there – it’s just a bit sharper now,” he said.',
 'https://pagesix.com/2025/05/23/celebrity-news/barry-keoghan-reveals-addiction-struggles-says-hes-got-the-scars-here-to-literally-prove-it/',
 'https://pagesix.com/wp-content/uploads/sites/3/2025/05/105174441.jpg?quality=75&strip=all&w=1024',
 '2025-05-23 16:26:00',
 'Barry Keoghan revealed that he struggles with addiction.\r\nThe “Saltburn” actor admitted to being an addict while reflecting on his parents’ deadly substance abuse in a recent interview with Authentic… [+2973 chars]'
),
(
  7,
 'John Melloy, Lisa Kailai Han',
 'Dow falls 300 points as Trump threatens new tariffs against the EU and Apple: Live updates - CNBC',
 'The S&P 500 closed near the flatline on Thursday, while the Dow Jones Industrial Average and Nasdaq Composite finished the session marginally lower.',
 'https://www.cnbc.com/2025/05/22/stock-market-today-live-updates.html',
 'https://image.cnbcfm.com/api/v1/image/108144107-1747059788299-gettyimages-2214703526-mms24296_fyz2crxz.jpeg?v=1748012714&w=1920&h=1080',
 '2025-05-23 16:15:00',
 'Stocks declined Friday after President Donald Trump raised trade fears again, warning Apple  and recommending stiffer duties on the European Union.\r\nThe Dow Jones Industrial Average lost 236 points, … [+2659 chars]'
),
(
 8,
 'Sal Romano',
 'FANTASY LIFE i: The Girl Who Steals Time free DLC ‘Update the World!’ announced - Gematsu',
 'Publisher LEVEL-5 and developer LEVEL-5 Osaka Office have announced plans to release a free downloadable content for FANTASY LIFE i: The Girl Who Steals Time, which includes new recipes and expande…',
 'https://www.gematsu.com/2025/05/fantasy-life-i-the-girl-who-steals-time-free-dlc-update-the-world-announced',
 'https://www.gematsu.com/wp-content/uploads/2025/05/Fantasy-Life-i-Free-DLC_05-23-25.jpg',
 '2025-05-23 15:49:24',
 'Publisher LEVEL-5 and developer LEVEL-5 Osaka Office have announced plans to release a free downloadable content for FANTASY LIFE i: The Girl Who Steals Time, which includes new recipes and expanded … [+898 chars]'
),
(
  5,
 'Unknown',
 'North Korea: Satellite photos show Kim Jong Un\'s damaged warship - BBC',
 'Kim Jong Un has called the shipyard accident a \'criminal act\' and vowed to find those responsible.',
 'https://www.bbc.com/news/articles/cx2qgdnxxe2o',
 'https://ichef.bbci.co.uk/news/1024/branded_news/3c8f/live/11e31340-37e8-11f0-8947-7d6241f9fce9.png',
 '2025-05-23 15:11:48',
 'North Korean leader Kim Jong Un has called the accident a \'criminal act\'\r\nSatellite images have for the first time shown the extent of a shipyard accident in North Korea that damaged a new warship in… [+1665 chars]'
),
(
  5,
 'Unknown',
 'Senzo Mchunu: South Africa crime statistics debunk \'white genocide\' claims - BBC',
 'Of the six most recent victims of farm killings, five were black and one white, the latest figures show.',
 'https://www.bbc.com/news/articles/cgr5xe7z0y0o',
 'https://ichef.bbci.co.uk/news/1024/branded_news/7feb/live/26b7c740-37d7-11f0-8947-7d6241f9fce9.jpg',
 '2025-05-23 15:00:43',
 'Wedaeli Chibelushi &amp; Nomsa MasekoBBC News, London &amp; Johannesburg\r\nSouth Africa\'s latest crime statistics debunk claims that a genocide is being committed against white people, the country\'s p… [+3389 chars]'
),
(
  9,
 'Unknown',
 'Ukraine and Russia begin the largest prisoner-of-war exchange since the invasion - NPR',
 'Ukraine and Russia have begun the exchange of 1,000 prisoners of war, the largest such swap since the beginning of Russia\'s full-scale invasion of Ukraine in February 2022.',
 'https://www.npr.org/2025/05/23/nx-s1-5408714/ukraine-russia-prisoners-exchange',
 'https://npr.brightspotcdn.com/dims3/default/strip/false/crop/1280x720+0+67/resize/1400/quality/100/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F19%2Fd8%2Fb9c9769345e7a887dfb75d479fe4%2Fgettyimages-2215927259.jpg',
 '2025-05-23 14:50:58',
 'A CITY IN NORTHERN UKRAINE Ukraine and Russia began the exchange of 1,000 prisoners of war Friday, the largest such swap since the beginning of Russia\'s full-scale invasion of Ukraine in February 202… [+3108 chars]'
),
(
  10,
 'Kyle Kucharski',
 'The 5 coolest gadgets I saw at Computex 2025 (and that you can actually buy) - ZDNET',
 'Many new gadgets and products debuted at the world\'s biggest computing event, but these stood out to me the most.',
 'https://www.zdnet.com/article/the-5-coolest-gadgets-i-saw-at-computex-2025-and-that-you-can-actually-buy/',
 'https://www.zdnet.com/a/img/resize/c18987ab50dcad88595e429ad7cba4580325b7f8/2025/05/21/2341cfc0-d22f-4ae6-a0ba-02286254dc4b/img-2272.jpg?auto=webp&fit=crop&height=675&width=1200',
 '2025-05-23 14:25:00',
 'Kyle Kucharski/ZDNET\r\nComputex 2025 just kicked off, and we\'re on the ground in Taipei with eyes on all the latest gadgets in the computing world. Unsurprisingly, AI is everywhere, with a general the… [+7027 chars]'
),
(
  11,
 'Ariel Zilber',
 'Chris Cuomo slams Democrats after Israeli Embassy staffers killed in DC: ‘Mind your dogs’ - New York Post',
 'Cuomo’s comments came just one day after a fatal shooting outside the Israeli embassy in Washington, DC, where embassy employees were gunned down.',
 'https://nypost.com/2025/05/23/media/chris-cuomo-slams-democrats-after-israeli-embassy-staffers-killed-in-dc/',
 'https://nypost.com/wp-content/uploads/sites/2/2025/05/105168612.jpg?quality=75&strip=all&w=1024',
 '2025-05-23 14:03:00',
 'Left-leaning NewsNation anchor Chris Cuomo blasted the Democratic Party for ignoring the threat of Islamist extremism in the US while remaining singularly focused on demonizing President Trump.\r\nCuom… [+2867 chars]'
),
(
  12,
 'Astha Rajvanshi',
 'Man wakes up to find a giant cargo ship in his yard - NBC News',
 'A man in Norway woke up to find a giant cargo ship had run aground in his yard.',
 'https://www.nbcnews.com/world/europe/norway-trondheim-fjord-container-ship-aground-yard-ncl-salten-rcna208703',
 'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2025-05/250523-norway-mb-1156-b058bd.jpg',
 '2025-05-23 13:53:46',
 'The North Sea Container Line (NCL), the shipping company that chartered the ship, said in a press release Friday that a rescue operation was ongoing, adding that its highest priority was to ensure a … [+794 chars]'
),
(
  12,
 'Rob Wile, Steve Kopack',
 'Apple stock sinks after Trump threatens 25% tariff if iPhones aren\'t made in the U.S. - NBC News',
 'Apple shares dropped as much as 3% Friday after President Donald Trump threatened the tech giant with a 25% tariff if it does not start producing iPhones in the U.S. — his latest salvo directly targeting a U.S. company over how it conducts its business.',
 'https://www.nbcnews.com/business/business-news/trump-threatens-25-tariff-apple-not-start-making-iphones-america-rcna208709',
 'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2025-05/250523-iphone-rs-6be01a.jpg',
 '2025-05-23 13:43:51',
 'Apple shares dropped as much as 3% Friday after President Donald Trump threatened the tech giant with a 25% tariff if it does not start producing iPhones in the U.S. his latest salvo directly targeti… [+5714 chars]'
),
(
  13,
 'Unknown',
 'College Football Playoff alters seeding process: Why Notre Dame emerges as biggest winner under new format - CBS Sports',
 'The Fighting Irish benefit the most from the big change implemented for the 2025 season',
 'https://www.cbssports.com/college-football/news/college-football-playoff-alters-seeding-process-why-notre-dame-emerges-as-biggest-winner-under-new-format/',
 'https://sportshub.cbsistatic.com/i/r/2025/05/23/3d5d9201-818e-4db9-81e3-aa9f15ce5249/thumbnail/1200x675/badbaa49bbac39e976f962acb598a609/notre-dame.png',
 '2025-05-23 13:31:28',
 'More from College Football\r\nThis has been quite the offseason for Notre Dame and coach Marcus Freeman. The College Football Playoff\'s decision to alter the seeding and first-round bye process for the… [+2802 chars]'
),
(
  14,
 'Action Network Staff',
 'NBA Playoffs Best Bets, Picks, Predictions for Friday, May 23 - Action Network',
 'Read along for our staff\'s NBA Playoffs best bets, picks, and predictions for Friday, May 23 using the latest odds and prop markets.',
 'https://www.actionnetwork.com/nba/nba-playoffs-best-bets-picks-predictions-for-friday-may-23-qs',
 'https://images.actionnetwork.com/blog/2025/05/NBAbestbets523.jpg',
 '2025-05-23 13:31:00',
 'The conference round of the NBA Playoffs resumes with one standalone matchup on Friday night, as Game 2 of the Eastern Conference Finals between the Pacers and Knicks takes center stage at 8:00 p.m. … [+4300 chars]'
);

-- Source: https://newsapi.org/