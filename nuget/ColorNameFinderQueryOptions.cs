using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.ColorNameFinder
{
    /// <summary>
    /// Query options for the Color Name Finder API
    /// </summary>
    public class ColorNameFinderQueryOptions
    {
        /// <summary>
        /// Hex color value (with or without # prefix)
        /// </summary>
        [JsonProperty("hex")]
        public string Hex { get; set; }

        /// <summary>
        /// Number of closest color matches to return
        /// </summary>
        [JsonProperty("closest")]
        public string Closest { get; set; }
    }
}
